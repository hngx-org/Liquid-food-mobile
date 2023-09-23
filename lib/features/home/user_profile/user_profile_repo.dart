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
    String url = AppUrl.lunchBalance;
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
        print('${response.statusCode} $userData ${jsonDecode(response.body)}');
      }
      if (response.statusCode == 200 || response.statusCode == 201) {
        final responseData = jsonDecode(response.body);
        UserProfileModel userProfile = UserProfileModel.fromJson(responseData);
        if (!context.mounted) {
          return;
        }
        context.read<UserViewModel>().saveUserDetails(
            accessToken: '',
            refreshToken: '',
            email: userProfile.data!.email.toString(),
            userId: userProfile.data!.id.toString(),
            fullName:
                '${userProfile.data!.firstName.toString()} ${userProfile.data!.lastName.toString()}',
            profilePath: userProfile.data!.profilePicture.toString(),
            orgName: userProfile.data!.organizationName.toString());
      } else if (response.statusCode == 400) {
        final responseData = jsonDecode(response.body);
        UserProfileModel userProfile = UserProfileModel.fromJson(responseData);
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
