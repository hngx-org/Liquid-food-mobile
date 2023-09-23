import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:free_lunch_app/features/home/models/all_co_workers.model.dart';
import 'package:free_lunch_app/features/home/models/co_worker.model.dart';
import 'package:free_lunch_app/features/home/models/search_by_email.model.dart';
import 'package:free_lunch_app/features/home/repository/irepository.home.dart';
import 'package:free_lunch_app/features/home/user_balance/user_balance.repo.dart';
import 'package:free_lunch_app/features/home/user_profile/user_profile_repo.dart';
import 'package:free_lunch_app/features/login/viewmodels/user.viewmodel.dart';
import 'package:free_lunch_app/utils/appurls.dart';
import 'package:free_lunch_app/utils/routing/utlils.dart';
import 'package:provider/provider.dart';
import 'package:http/http.dart' as http;

class HomeRepository extends IRepositoryHome {
  IUserBalanceRepo userBalanceRepo = UserBalanceRepo();
  IUserProfileRepo userProfileRepo = UserProfileRepo();
  @override
  Future<List<CoWorker>> fetchCoworkerItems(
      BuildContext context, searchController) async {
    userBalanceRepo.fetchUserBalance(context);
    userProfileRepo.fetchUserProfile(context);

    String url = AppUrl.userAll;
    if (searchController.text.toString().isNotEmpty) {
      url = '${AppUrl.searchUser}name/${searchController.text.toLowerCase()}';
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
      if (kDebugMode) {
        print('${response.statusCode} $userData ${jsonDecode(response.body)}');
      }
      if (response.statusCode == 200 || response.statusCode == 201) {
        final responseData = jsonDecode(response.body);
        AllUserModel allUsers = AllUserModel.fromJson(responseData);

        if (context.mounted) {
          // Utils.snackBarMessage(allUsers.message.toString(), context);
        }
        List<CoWorker> coworkersList = allUsers.data!.toList();
        return coworkersList;
      } else if (response.statusCode == 400) {
        final responseData = jsonDecode(response.body);
        AllUserModel allUsers = AllUserModel.fromJson(responseData);
        if (context.mounted) {
          Utils.snackBarMessage(allUsers.message.toString(), context);
        }
      }
    } catch (e) {
      if (context.mounted) {
        Utils.handleException(e, context);
      }
    }
    throw 'No User found';
  }

  @override
  Future<List<UserbyEmail>> fetchCoworkerByemail(
      BuildContext context, TextEditingController searchController) async {
    String url = AppUrl.userAll;
    if (Utils.isValidEmail(searchController.text.toLowerCase())) {
      url = '${AppUrl.searchUser}email/${searchController.text.toLowerCase()}';
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
      if (kDebugMode) {
        print('${response.statusCode} $userData ${jsonDecode(response.body)}');
      }
      if (response.statusCode == 200 || response.statusCode == 201) {
        final responseData = jsonDecode(response.body);
        SearchUserbyEmail usersbyEmail =
            SearchUserbyEmail.fromJson(responseData);
        List<UserbyEmail> usersList = [usersbyEmail.data!];
        return usersList;
      } else if (response.statusCode == 400) {
        final responseData = jsonDecode(response.body);
        AllUserModel allUsers = AllUserModel.fromJson(responseData);
        if (context.mounted) {
          Utils.snackBarMessage(allUsers.message.toString(), context);
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
