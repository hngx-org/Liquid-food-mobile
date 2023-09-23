import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class UserViewModel extends ChangeNotifier {
  late SharedPreferences _prefs;
  String? _accessToken;
  String? _refreshToken;
  String? _email;
  String? _userId;

  UserViewModel() {
    _loadUserDetails();
  }

  Future<void> _loadUserDetails() async {
    _prefs = await SharedPreferences.getInstance();
    _accessToken = _prefs.getString('access_token') ?? '';
    _refreshToken = _prefs.getString('refresh_token') ?? '';
    _email = _prefs.getString('email') ?? '';
    _userId = _prefs.getString('user_id') ?? '';
    notifyListeners();
  }

  String? get accessToken => _accessToken;
  String? get refreshToken => _refreshToken;
  String? get email => _email;
  String? get userId => _userId;

  Future<void> saveUserDetails({
    required String accessToken,
    required String refreshToken,
    required String email,
    required String userId,
  }) async {
    _accessToken = accessToken;
    _refreshToken = refreshToken;
    _email = email;
    _userId = userId;

    await _prefs.setString('access_token', accessToken);
    await _prefs.setString('refresh_token', refreshToken);
    await _prefs.setString('email', email);
    await _prefs.setString('user_id', userId);

    notifyListeners();
  }
}
