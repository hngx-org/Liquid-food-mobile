import 'dart:convert';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:free_lunch_app/features/home/repository/irepository.home.dart';
import 'package:free_lunch_app/features/login/viewmodels/user.viewmodel.dart';
import 'package:free_lunch_app/utils/appurls.dart';
import 'package:free_lunch_app/utils/routing/utlils.dart';
import 'package:provider/provider.dart';
import 'package:http/http.dart' as http;

class HomeRepository extends IRepositoryHome {
  @override
  Future<List<dynamic>> fetchCoworkerItems(
      BuildContext context, searchController) async {
    String url = AppUrl.userAll;
    if (searchController.text.toString().isNotEmpty) {
      url =
          '${AppUrl.searchUser}?keyword=${searchController.text.toLowerCase()}';
    }

    final userData = context.read<UserViewModel>();
    final accessToken = userData.accessToken.toString();
    Map<String, String> headers = {
      "content-type": "application/json",
      "Authorization": "Bearer $accessToken",
    };
    try {
      if (kDebugMode) {
        print(AppUrl.loginUrl);
      }
      http.Response response = await http.get(Uri.parse(url), headers: headers);

      final responseData = jsonDecode(response.body);
      if (kDebugMode) {
        // print('${response.statusCode} ${responseData['data']}');
      }
      if (response.statusCode == 200 || response.statusCode == 201) {
        if (kDebugMode) {
          print(
              '${responseData['message']}${responseData['data'][0]['organizations']['profilePic']} ');
        }

        final users = await responseData['data'];

        return users;
      } else if (response.statusCode == 400) {
        if (context.mounted) {
          Utils.snackBarMessage(responseData['message'].toString(), context);
        }
      }
    } catch (e) {
      if (context.mounted) {
        Utils.handleException(e, context);
      }
    }
    throw 'No User found';
  }
}
