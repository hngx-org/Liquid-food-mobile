import 'package:flutter/material.dart';
import 'package:free_lunch_app/features/home/view/admin_home.dart';
import 'package:free_lunch_app/features/login/view/login.dart';
import 'package:free_lunch_app/features/signUP/view/signup.dart';
import 'package:free_lunch_app/screens/new_screen/auth_screen_api.dart';
import 'package:free_lunch_app/screens/new_screen/change_password_screen.dart';

import 'package:free_lunch_app/screens/new_screen/profile_page.dart';
import 'package:free_lunch_app/screens/screens.dart';
import '../../../features/home/view/home_page.dart';
import '../../../screens/new_screen/login_screen.dart';
import '../../../withdrawal/presentation/pages/withdraw_account.dart';
import '../../../withdrawal/presentation/pages/withdrawal_screen.dart';
import 'package:free_lunch_app/feature/lunches/presentation/lunches_view.dart';
import 'package:free_lunch_app/features/home/view/home_page.dart';

class Routes {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    Widget page;
    switch (settings.name) {
      case '/':
        // page = const AuthScreen();
        // page = const AuthScreenAPI();
        page = const SignScreenAPI();
        break;
      case '/home':
        page = const HomePage();
        break;
      case '/lunches':
        page = const LunchesView();
        break;
      case '/profile':
        page = const ProfileImagePage();
        break;
      case '/log-in':
        // page = const LoginScreen();
        page = const AuthLoginScreen();
        break;
      case '/withdrawal-screen':
        page = const WithdrawalScreen();
        break;
      case '/withdraw-account':
        page = const WithdrawalAccount();
        break;
      case '/admin-home':
        page = const AdminHome();
        break;
      case '/change-password':
        page = const ChangePasswordScreen();
        break;
      default:
        page = const Center(
          child: Text('No Specified Route'),
        );
    }
    return PageRouteBuilder(
      pageBuilder: (_, __, ___) => page,
      transitionDuration: const Duration(seconds: 0),
    );
  }
}
