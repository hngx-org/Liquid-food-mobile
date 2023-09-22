import 'package:flutter/material.dart';
import 'package:free_lunch_app/features/home/home_page.dart';

class Routes {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    Widget page;
    switch (settings.name) {
      case '/home':
        page = const HomePage();
        break;
      case '/lunches':
        page = const Center(
          child: Text('lunches'),
        );
        break;
      case '/profile':
        page = const Center(
          child: Text('profile'),
        );
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
