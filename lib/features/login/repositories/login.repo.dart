import 'dart:convert';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:free_lunch_app/features/login/model/login.model.dart';
import 'package:free_lunch_app/features/login/model/user.login_model.dart';
import 'package:free_lunch_app/features/login/viewmodels/login.viewmodel.dart';
import 'package:free_lunch_app/utils/appurls.dart';
import 'package:free_lunch_app/utils/routing/utlils.dart';
import 'package:http/http.dart' as http;
import 'package:provider/provider.dart';

abstract class ILoginRepo {
  Future<UserModel> login(LoginModel login, BuildContext context);
}

class LoginRepository extends ILoginRepo {
  @override
  Future<UserModel> login(login, context) async {
    final url = AppUrl.loginUrl;
    final userData = login.toJson();
    final load = Provider.of<LoginViewModel>(context, listen: false);
    Map<String, String> headers = {"content-type": "application/json"};
    try {
      if (kDebugMode) {
        print(AppUrl.loginUrl);
      }
      http.Response response =
          await http.post(Uri.parse(url), body: userData, headers: headers);
      if (kDebugMode) {
        print('${response.statusCode} $userData ${jsonDecode(response.body)}');
      }
      if (response.statusCode == 200 || response.statusCode == 201) {
        load.setLoading(false);
        final responseData = jsonDecode(response.body);
        // if (context.mounted) {
        //   await userProfileRepo.fetchUserProfile(context);
        // }
        UserModel user = UserModel.fromJson(responseData);

        if (context.mounted) {
          Utils.snackBarMessage(user.message.toString(), context);
        }
        return user;
      } else if (response.statusCode == 400) {
        final responseData = jsonDecode(response.body);
        load.setLoading(false);
        UserModel user = UserModel.fromJson(responseData);
        if (context.mounted) {
          Utils.snackBarMessage(user.message.toString(), context);
        }
      }
    } catch (e) {
      load.setLoading(false);
      if (context.mounted) {
        Utils.handleException(e, context);
      }
    }
    throw 'No User found';
  }
}
