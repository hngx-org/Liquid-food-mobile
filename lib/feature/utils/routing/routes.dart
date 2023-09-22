import 'package:flutter/material.dart';
import 'package:free_lunch_app/feature/lunches/presentation/lunches_view.dart';
import 'package:free_lunch_app/features/home/view/home_page.dart';
import 'package:free_lunch_app/screens/new_screen/auth_screen.dart';
import 'package:free_lunch_app/screens/new_screen/login_screen.dart';
import 'package:free_lunch_app/screens/new_screen/profile_page.dart';
import 'package:free_lunch_app/withdrawal/presentation/pages/withdraw_account.dart';
import 'package:free_lunch_app/withdrawal/presentation/pages/withdrawal_screen.dart';

class Routes {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    Widget page;
    switch (settings.name) {
      case '/home':
        page = const HomePage();
        break;
      case '/lunches':
        page = const LunchesView();
        break;
      case '/profile':
        page = const Center(
          child: Text('Profile'),
        );
      case '/log-in':
        page = const LoginScreen();
      case '/withdrawal-screen':
        page = const WithdrawalScreen();
      case '/withdraw-account':
        page = const WithdrawalAccount();
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
