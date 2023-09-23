import 'package:flutter/material.dart';
import 'package:free_lunch_app/features/login/model/login.model.dart';
import 'package:free_lunch_app/features/login/repositories/login.repo.dart';
import 'package:free_lunch_app/features/login/viewmodels/user.viewmodel.dart';
import 'package:free_lunch_app/utils/routing/utlils.dart';
import 'package:provider/provider.dart';

class LoginViewModel with ChangeNotifier {
  ILoginRepo loginRepo = LoginRepository();

  Future<void> login(BuildContext context, LoginModel loginModel) async {
    loginRepo.login(loginModel, context).then((value) {
      if (value.statusCode == 200 || value.statusCode == 201) {
        final userPrefs = Provider.of<UserViewModel>(context, listen: false);

        userPrefs.saveUserDetails(
            accessToken: value.data!.accessToken.toString(),
            refreshToken: value.data!.refreshToken.toString(),
            email: value.data!.email.toString(),
            userId: value.data!.id.toString(),
            profilePath: '',
            orgName: '',
            fullName: '');
        Utils.mainAppNav.currentState?.pushReplacementNamed('/home');
      } else {
        return;
      }
    });
  }
}
