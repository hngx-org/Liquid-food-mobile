import 'package:flutter/material.dart';

import 'package:free_lunch_app/screens/new_screen/profile_page.dart';
import '../../../features/home/view/home_page.dart';
import '../../../screens/new_screen/login_screen.dart';
import '../../../withdrawal/presentation/pages/withdraw_account.dart';
import '../../../withdrawal/presentation/pages/withdrawal_screen.dart';
import '../../lunches/presentation/lunches_view.dart';

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
        page = const ProfileImagePage();
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
