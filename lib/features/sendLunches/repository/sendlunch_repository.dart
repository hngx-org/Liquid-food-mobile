import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:free_lunch_app/features/login/viewmodels/user.viewmodel.dart';
import 'package:free_lunch_app/features/sendLunches/models/sendlunch.model.dart';
import 'package:free_lunch_app/features/sendLunches/repository/irepository.sendlunch.dart';
import 'package:free_lunch_app/features/sendLunches/view/lunch_sent.dart';

import 'package:free_lunch_app/features/sendLunches/viewmodel/sendlunch.viewmodel.dart';
import 'package:free_lunch_app/utils/appurls.dart';
import 'package:free_lunch_app/utils/routing/utlils.dart';
import 'package:http/http.dart' as http;
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SendLunchRepository extends IRepositorySendLunch {
  @override
  Future<void> sendLunches(
      BuildContext context, SendLunchItem sendLunchItem) async {
    final url = "${AppUrl.sendLunch}/${sendLunchItem.id}";
    final userData = context.read<UserViewModel>();
    final accessToken = userData.accessToken.toString();
    Map<String, String> headers = {
      "content-type": "application/json",
      "Authorization": "Bearer $accessToken",
    };

    try {
      if (kDebugMode) {
        print(url);
      }
      http.Response response = await http.post(Uri.parse(url),
          body: sendLunchItem.toJson(), headers: headers);
      final responseData = jsonDecode(response.body);

      if (kDebugMode) {
        print(
            '${response.statusCode} $sendLunchItem ${jsonDecode(response.body)}');
      }
      if (response.statusCode == 200 || response.statusCode == 201) {
        // if (context.mounted) {
        //   await userProfileRepo.fetchUserProfile(context);
        // }

        if (context.mounted) {
          Provider.of<SendLunchVM>(context, listen: false).setLoading(false);
          Utils.snackBarMessage(responseData['message'].toString(), context);
          SharedPreferences sp = await SharedPreferences.getInstance();
          await sp.setString('msg', responseData['message'].toString());
          final name = sp.getString('name');
          final lunchcount = sp.getInt('lunch');
          Utils.mainAppNav.currentState?.push(MaterialPageRoute(
              builder: (_) => LunchSent(
                  lunchCount: lunchcount!.toInt(),
                  recieverName: name.toString())));
        }
        return responseData['statusCode'];
      } else if (response.statusCode == 400) {
        if (context.mounted) {
          Provider.of<SendLunchVM>(context, listen: false).setLoading(false);
          Utils.snackBarMessage(responseData['message'].toString(), context);
        }
      }
    } catch (e) {
      if (context.mounted) {
        Provider.of<SendLunchVM>(context, listen: false).setLoading(false);
        Utils.handleException(e, context);
      }
    }
    throw 'No User found';
  }
}
