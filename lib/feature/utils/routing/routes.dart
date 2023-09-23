import 'package:flutter/material.dart';

import '../../../features/home/view/admin_home.dart';
import '../../../features/home/view/home_page.dart';
import '../../auth/new_screen/invited_account_screen.dart';
import '../../auth/new_screen/login_screen.dart';
import '../../auth/new_screen/profile_page.dart';
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
        break;
      case '/log-in':
        page = const LoginScreen();
        break;
      case '/withdrawal-screen':
        page = const WithdrawalScreen();
        break;
      case '/invite-screen':
        page = const InvitedAccountScreen();
        break;
      case '/withdraw-account':
        page = const WithdrawalAccount();
        break;

      case '/admin-home':
        page = const AdminHome();
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
