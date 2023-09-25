import 'dart:convert';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import '../../signUP/model/signup_model.dart';
import '../../signUP/model/user.signup_model.dart';
import 'package:free_lunch_app/utils/appurls.dart';
import 'package:free_lunch_app/utils/routing/utlils.dart';
import 'package:http/http.dart' as http;

abstract class ISignupRepo {
  Future<UserModel> signup(SignupModel signup, BuildContext context);
}

class SignupRepository extends ISignupRepo {
  @override
  Future<UserModel> signup(signup, context) async {
    final url = signup.isAdmin ? AppUrl.adminSignupUrl : AppUrl.staffsignupUrl;
    final userData = signup.toJson();
    Map<String, String> headers = {"content-type": "application/json"};
    try {
      if (kDebugMode) {
        print(url);
      }
      http.Response response =
          await http.post(Uri.parse(url), body: userData, headers: headers);
      if (kDebugMode) {
        print('${response.statusCode} $userData ${jsonDecode(response.body)}');
      }
      if (response.statusCode == 200 || response.statusCode == 201) {
        final responseData = jsonDecode(response.body);

        UserModel user = UserModel.fromJson(responseData);

        if (context.mounted) {
          Utils.snackBarMessage(user.message.toString(), context);
        }
        return user;
      } else if (response.statusCode == 400) {
        final responseData = jsonDecode(response.body);

        UserModel user = UserModel.fromJson(responseData);
        if (context.mounted) {
          Utils.snackBarMessage(user.message.toString(), context);
        }
      }
    } catch (e) {
      if (context.mounted) {
        Utils.handleException(e, context);
      }
    }
    throw 'Invalid Credentials';
  }
}