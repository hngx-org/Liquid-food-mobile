// ignore_for_file: use_build_context_synchronously

import 'package:flutter/material.dart';

import '../../../withdrawal/presentation/widgets/screen_styles.dart';
import '../model/admin_model.dart';
import '../repositories/create_org_repo.dart';

class CreatAcctViewModel extends ChangeNotifier {
  // ICreateAdminRepo admRepo = CreateAdminRepository();

  String _fullName = '';
  String _organizationName = '';
  String _email = '';
  String _phoneNumber = '';
  String _password = '';

  set fullName(value) => _fullName = value;

  set organizationName(value) => _organizationName = value;
  set email(value) => _email = value;
  set phoneNumber(value) => _phoneNumber = value;
  set password(value) => _password = value;

  Future<void> register(BuildContext context) async {
    var user = AdminUser(
      email: _email.trim(),
      password: _password.trim(),
      fullName: _fullName.trim(),
      phoneNumber: _phoneNumber.trim(),
      organizationName: _organizationName.trim(),
    );

    var result = await AuthService.registerUser(user);

    if (!result.hasError()) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          padding: EdgeInsets.all(10.0),
          backgroundColor: Colors.green,
          content: WText(
            text: 'User created succesfully',
            color: Colors.white,
          ),
        ),
      );
      Navigator.pushNamed(context, '/log-in');

      return;
    }

    notifyListeners();
  }
}
