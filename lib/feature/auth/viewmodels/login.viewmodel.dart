import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../model/login.model.dart';
import '../repositories/login.repo.dart';
import '../user.viewmodel.dart';

class LoginViewModel with ChangeNotifier {
  ILoginRepo loginRepo = LoginRepository();

  Future<void> login(BuildContext context, LoginModel loginModel) async {
    loginRepo.login(loginModel, context).then((value) {
      if (value.statusCode == 200) {
        final userPrefs = Provider.of<UserViewModel>(context);

        userPrefs.saveUserDetails(
            accessToken: value.data!.accessToken.toString(),
            refreshToken: value.data!.refreshToken.toString(),
            email: value.data!.email.toString(),
            userId: value.data!.id.toString());
      } else {
        return;
      }
    });
  }
}
