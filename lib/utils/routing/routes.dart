import 'package:flutter/material.dart';
import 'package:free_lunch_app/feature/lunches/presentation/lunches_view.dart';
import 'package:free_lunch_app/features/home/view/home_page.dart';
import '../../withdrawal/presentation/pages/withdraw_account.dart';
import '../../withdrawal/presentation/pages/withdrawal_screen.dart';
import '../../feature/auth/pages/invited_account_screen.dart';
import '../../features/home/view/admin_home.dart';
import '../../feature/auth/pages/profile_page.dart';
import '../../feature/auth/pages/login_screen.dart';

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
