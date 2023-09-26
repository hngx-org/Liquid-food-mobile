import 'dart:convert';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:free_lunch_app/features/home/user_profile/model/user_profile.model.dart';
import 'package:free_lunch_app/features/login/viewmodels/user.viewmodel.dart';
import 'package:free_lunch_app/utils/appurls.dart';
import 'package:free_lunch_app/utils/routing/utlils.dart';
import 'package:http/http.dart' as http;
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

abstract class IUserProfileRepo {
  Future<dynamic> fetchUserProfile(BuildContext context);
}

class UserProfileRepo extends IUserProfileRepo {
  @override
  Future<dynamic> fetchUserProfile(BuildContext context) async {
    String url = AppUrl.userProfile;
    final userData = context.read<UserViewModel>();
    final accessToken = userData.accessToken.toString();
    SharedPreferences sp = await SharedPreferences.getInstance();
    Map<String, String> headers = {
      "content-type": "application/json",
      "Authorization": "Bearer $accessToken",
    };
    try {
      if (kDebugMode) {
        print(AppUrl.userProfile);
      }
      http.Response response = await http.get(Uri.parse(url), headers: headers);
      if (kDebugMode) {
        print('${response.statusCode} $userData ${jsonDecode(response.body)}');
      }
      final responseData = await jsonDecode(response.body);
      if (response.statusCode == 200 || response.statusCode == 201) {
        if (kDebugMode) {
          print('object ${responseData['data']['firstName']}');
        }
        final fullName =
            '${responseData['data']['firstName']} ${responseData['data']['lastName']}';
        final balance = '${responseData['data']['lunchCreditBalance']}';
        final isAdmin = responseData['data']['isAdmin'];

        await sp.setString('full_name', fullName);
        await sp.setString('lunch_balance', balance);
        await sp.setBool('isAdmin', isAdmin);
        if (kDebugMode) {
          print(fullName + isAdmin.toString());
        }

        return responseData;
      } else if (response.statusCode == 400) {
        UserProfile userProfile = UserProfile.fromJson(responseData);
        if (context.mounted) {
          Utils.snackBarMessage(userProfile.message.toString(), context);
        }
      }
    } catch (e) {
      if (context.mounted) {
        Utils.handleException(e, context);
      }
    }
  }
}
