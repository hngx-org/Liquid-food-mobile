import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:free_lunch_app/features/home/user_profile/model/user_profile.model.dart';
import 'package:free_lunch_app/features/login/viewmodels/user.viewmodel.dart';
import 'package:free_lunch_app/utils/appurls.dart';
import 'package:free_lunch_app/utils/routing/utlils.dart';
import 'package:http/http.dart' as http;
import 'package:provider/provider.dart';

abstract class IUserProfileRepo {
  Future<void> fetchUserProfile(BuildContext context);
}

class UserProfileRepo extends IUserProfileRepo {
  @override
  Future<void> fetchUserProfile(BuildContext context) async {
    String url = AppUrl.userProfile;
    final userData = context.read<UserViewModel>();
    final accessToken = userData.accessToken.toString();
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
        // print('${response.statusCode} $userData ${jsonDecode(response.body)}');
      }

      final responseData = await jsonDecode(response.body);
      if (responseData != null) {
        if (kDebugMode) {
          print("Profile APi:$responseData" +
              responseData['data']['lunchCreditBalance']);
        }
        if (context.mounted) {
          Provider.of<UserViewModel>(context).saveUserDetails(
              accessToken: '',
              refreshToken: '',
              email: responseData['data']['email'].toString(),
              userId: responseData['data']['id'].toString(),
              fullName:
                  '${responseData['data']['firstName']} ${responseData['data']['lastName']}',
              profilePath: responseData['data']['profilePic'].toString(),
              orgName: responseData['data']['organizations']['name'].toString(),
              balance: responseData['data']['lunchCreditBalance'].toString());
        }
      }
      if (response.statusCode == 200 || response.statusCode == 201) {
        final responseData = await jsonDecode(response.body);
        if (kDebugMode) {
          print("Profile APi:$responseData" +
              responseData['data']['lunchCreditBalance']);
        }
        if (context.mounted) {
          Provider.of<UserViewModel>(context).saveUserDetails(
              accessToken: '',
              refreshToken: '',
              email: responseData['data']['email'].toString(),
              userId: responseData['data']['id'].toString(),
              fullName:
                  '${responseData['data']['firstName']} ${responseData['data']['lastName']}',
              profilePath: responseData['data']['profilePic'].toString(),
              orgName: responseData['data']['organizations']['name'].toString(),
              balance: responseData['data']['lunchCreditBalance'].toString());
        }
      } else if (response.statusCode == 400) {
        final responseData = jsonDecode(response.body);
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
