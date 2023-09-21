import 'package:flutter/material.dart';
import 'package:free_lunch_app/features/main/bottom_nav.dart';
import 'package:free_lunch_app/utils/routing/routes.dart';
import 'package:free_lunch_app/utils/routing/utlils.dart';

class BottomNavShell extends StatelessWidget {
  const BottomNavShell({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Stack(
          children: [
            Expanded(
              child: Navigator(
                key: Utils.mainListNav,
                initialRoute: '/home',
                onGenerateRoute: (settings) => Routes.generateRoute(settings),
              ),
            ),
            const Positioned(bottom: 0, left: 0, right: 0, child: BottomNav()),
          ],
        ),
      ),
    );
  }
}
