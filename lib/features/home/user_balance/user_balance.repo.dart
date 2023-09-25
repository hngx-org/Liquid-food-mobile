import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:free_lunch_app/features/home/user_balance/model/lunch_balance.model.dart';
import 'package:free_lunch_app/features/login/viewmodels/user.viewmodel.dart';
import 'package:free_lunch_app/utils/appurls.dart';
import 'package:free_lunch_app/utils/routing/utlils.dart';
import 'package:provider/provider.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

abstract class IUserBalanceRepo {
  Future<void> fetchUserBalance(BuildContext context);
}

class UserBalanceRepo extends IUserBalanceRepo {
  @override
  Future<void> fetchUserBalance(BuildContext context) async {
    String url = AppUrl.lunchBalance;
    final userData = context.read<UserViewModel>();
    final accessToken = userData.accessToken.toString();
    Map<String, String> headers = {
      "content-type": "application/json",
      "Authorization": "Bearer $accessToken",
    };
    try {
      if (kDebugMode) {
        print(AppUrl.lunchBalance);
      }
      http.Response response = await http.get(Uri.parse(url), headers: headers);
      if (kDebugMode) {
        print('${response.statusCode} $userData ${jsonDecode(response.body)}');
      }
      if (response.statusCode == 200 || response.statusCode == 201) {
        final responseData = jsonDecode(response.body);
        LunchCredits lunchCredit = LunchCredits.fromJson(responseData);
        SharedPreferences sp = await SharedPreferences.getInstance();
        sp.setString('balance', lunchCredit.data.toString());
        // if (context.mounted) {
        //   Utils.snackBarMessage(allUsers.message.toString(), context);
        // }
      } else if (response.statusCode == 400) {
        final responseData = jsonDecode(response.body);
        LunchCredits lunchCredit = LunchCredits.fromJson(responseData);
        if (context.mounted) {
          Utils.snackBarMessage(lunchCredit.message.toString(), context);
        }
        // lunchCredit.data;
      }
    } catch (e) {
      if (context.mounted) {
        Utils.handleException(e, context);
      }
    }
  }
}
