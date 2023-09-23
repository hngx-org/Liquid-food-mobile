import 'dart:convert';
import 'dart:io';
import 'package:flutter/material.dart';

import 'package:http/http.dart' as http;
import 'package:http/http.dart';

import '../../../../feature/utils/routing/utlils.dart';
import '../model/login.model.dart';
import '../model/user.login_model.dart';

abstract class ILoginRepo {
  Future<UserModel> login(LoginModel login, BuildContext context);
}

class LoginRepository extends ILoginRepo {
  @override
  Future<UserModel> login(login, context) async {
    final url = AppUrl.loginUrl;
    try {
      Response response = await http
          .post(Uri.parse(url), body: login.toJson())
          .timeout(const Duration(seconds: 10));

      if (response.statusCode == 200 || response.statusCode == 201) {
        final responseData = jsonDecode(response.body);
        UserModel user = UserModel.fromJson(responseData);

        return user;
      } else {}
    } on (SocketException,) {
      if (context.mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Text('No Internet Connection'),
          ),
        );
      }
    }
    throw 'No User found';
  }
}
