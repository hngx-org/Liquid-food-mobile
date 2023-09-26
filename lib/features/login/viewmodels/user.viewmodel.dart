import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class UserViewModel extends ChangeNotifier {
  late SharedPreferences _prefs;
  String? _accessToken;
  String? _refreshToken;
  String? _email;
  String? _userId;
  String? _fullName;
  String? _profilePath;
  String? _orgName;
  String? _balance;

  UserViewModel() {
    _loadUserDetails();
  }

  Future<void> _loadUserDetails() async {
    _prefs = await SharedPreferences.getInstance();
    _accessToken = _prefs.getString('access_token') ?? '';
    _refreshToken = _prefs.getString('refresh_token') ?? '';
    _email = _prefs.getString('email') ?? '';
    _userId = _prefs.getString('user_id') ?? '';
    _fullName = _prefs.getString('full_name') ?? '';
    _profilePath = _prefs.getString('profile_path') ?? '';
    _orgName = _prefs.getString('org_name');
    _balance = _prefs.getString('balance');
    notifyListeners();
  }

  String? get accessToken => _accessToken;
  String? get refreshToken => _refreshToken;
  String? get email => _email;
  String? get userId => _userId;
  String? get fullName => _fullName;
  String? get orgName => _orgName;
  String? get profilePath => _profilePath;
  String? get balance => _balance;

  Future<void> saveUserDetails(
      {required String accessToken,
      required String refreshToken,
      required String email,
      required String userId,
      required String fullName,
      required String profilePath,
      required String orgName,
      required String balance}) async {
    _accessToken = accessToken;
    _refreshToken = refreshToken;
    _email = email;
    _userId = userId;
    _fullName = fullName;
    _orgName = orgName;
    _profilePath = profilePath;
    _balance = balance;

    await _prefs.setString('access_token', accessToken);
    await _prefs.setString('refresh_token', refreshToken);
    await _prefs.setString('email', email);
    await _prefs.setString('user_id', userId);
    await _prefs.setString('full_name', fullName);
    await _prefs.setString('org_name', orgName);
    await _prefs.setString('profile_path', profilePath);
    await _prefs.setString('balance', balance);
    notifyListeners();
  }
}
