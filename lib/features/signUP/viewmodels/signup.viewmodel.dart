import 'package:flutter/material.dart';
// import 'package:free_lunch_app/features/login/model/login.model.dart';
// import 'package:free_lunch_app/features/login/repositories/login.repo.dart';
// import 'package:free_lunch_app/features/login/viewmodels/user.viewmodel.dart';
import 'package:free_lunch_app/features/signUP/model/signup_model.dart';
import 'package:free_lunch_app/features/signUP/repositories/signup.repo.dart';
import 'package:free_lunch_app/utils/routing/utlils.dart';
import 'package:provider/provider.dart';
import 'user.viewmodel.dart';

class SignUpViewModel with ChangeNotifier {
  ISignupRepo signupRepo = SignupRepository();

  bool _isLoading = false;
  bool get isLoading => _isLoading;

  void setLoading(bool loading) {
    _isLoading = loading;
    notifyListeners();
  }

  Future<void> login(BuildContext context, SignupModel signupModel) async {
    setLoading(true);
    signupRepo.signup(signupModel, context).then((value) {
      if (value.statusCode == 200 || value.statusCode == 201) {
        final userPrefs = Provider.of<UsersViewModel>(context, listen: false);
        setLoading(false);
        userPrefs.saveUserDetails(
            accessToken: value.data!.accessToken.toString(),
            refreshToken: value.data!.refreshToken.toString(),
            email: value.data!.email.toString(),
            userId: value.data!.id.toString(),
            profilePath: '',
            orgName: value.data!.orgName.toString(),
            fullName: value.data!.fullName.toString(),
            isAdmin: value.data!.isAdmin ?? false);
        Utils.mainAppNav.currentState?.pushReplacementNamed('/home');
      } else {
        return;
      }
    });
  }
}