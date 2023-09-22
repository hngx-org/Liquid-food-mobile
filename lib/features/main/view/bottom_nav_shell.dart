import 'package:flutter/material.dart';
import 'package:free_lunch_app/features/main/view/bottom_nav.dart';
import 'package:free_lunch_app/feature/utils/routing/routes.dart';
import 'package:free_lunch_app/feature/utils/routing/utlils.dart';

class BottomNavShell extends StatelessWidget {
  const BottomNavShell({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: SafeArea(
        child: Column(
          children: [
            Flexible(
              child: Navigator(
                key: Utils.mainListNav,
                initialRoute: '/home',
                onGenerateRoute: (settings) => Routes.generateRoute(settings),
              ),
            ),
            const Align(alignment: Alignment.bottomCenter, child: BottomNav()),
          ],
        ),
      ),
    );
  }
}
