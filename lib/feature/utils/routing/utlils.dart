import 'package:flutter/material.dart';

class Utils {
  static GlobalKey<NavigatorState> mainListNav = GlobalKey();
  static GlobalKey<NavigatorState> mainAppNav = GlobalKey();
}

class AppUrl {
  static String baseUrl =
      'https://liquid-food-backend-production.up.railway.app/';

  //Post url
  static String get loginUrl => '${baseUrl}api/auth/login';
  static String get staffsignupUrl => '${baseUrl}api/auth/staff/signup';
  static String get refreshUrl => '${baseUrl}api/auth/refresh-token';
  static String get adminSignupUrl => '${baseUrl}api/auth/admin/signup';
  static String get sendLunch => '${baseUrl}api/lunch/send';
  static String get uploadImage => '${baseUrl}api/user/upload-image';
  static String get withdrawal => '${baseUrl}api/withdrawal/request';

  //Get url
  static String get lunchById => '${baseUrl}api/lunch/';
  static String get lunchBalance => '${baseUrl}api/lunch/balance';
  static String get lunchAll => '${baseUrl}api/lunch/all';
  static String get orgInvite => '${baseUrl}api/organization/invite';
  static String get orgLunch => '${baseUrl}api/organization/lunch';
  static String get userBank => '${baseUrl}api/user/bank';
  static String get searchUser => '${baseUrl}api/user/search/';
  static String get userProfile => '${baseUrl}api/user/profile';
  static String get userBankDetails => '${baseUrl}api/user/bank-details';
  static String get userAll => '${baseUrl}api/user/all';
}

class TextFieldValidator {
  // TextValidator used in TextFormField
  String? password;

  get forTextOnly => (String? value) {
        if (value!.isEmpty) {
          return 'required';
        } else {
          return null;
        }
      };

  get forEmailOnly => (String? value) {
        if (value!.isEmpty) {
          return "*email is required";
        } else if (!value.contains("@")) {
          return "*invalid email address";
        } else if (value.split("@")[0] == "" && value.split("@")[1] == "") {
          return "*invalid email address";
        } else if (value.split("@")[0] == "" || value.split("@")[1] == "") {
          return "invalid email address";
        } else {
          return null;
        }
      };

  get forPassword => (String? value) {
        password = value;
        if (value!.isEmpty) {
          return 'required';
        } else if (value.length <= 7) {
          return 'password must be at least 8 characters';
        } else {
          return null;
        }
      };

  get forConfirmPassword => (String? value) {
        if (value!.isEmpty) {
          return 'required';
        } else if (value != password) {
          return 'password mismatched';
        } else {
          return null;
        }
      };

  get forPhoneNumber => (String? value) {
        if (value!.isEmpty) {
          return "Phone number required";
        } else if (value.length > 15) {
          return "Invalid phone number";
        } else if (value.contains(RegExp(r'[A-Z]'))) {
          return "Invalid phone number";
        } else {
          return null;
        }
      };

  get forPreferName => (String? value) {
        if (value!.isEmpty) {
          return "required";
        } else {
          return null;
        }
      };
}
