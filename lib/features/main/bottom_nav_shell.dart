import 'package:flutter/material.dart';
import 'package:free_lunch_app/features/main/bottom_nav.dart';
import '../../feature/utils/routing/routes.dart';
import '../../feature/utils/routing/utlils.dart';

class BottomNavShell extends StatelessWidget {
  const BottomNavShell({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      body: Column(
        children: [
          Expanded(
            child: Navigator(
              key: Utils.mainListNav,
              initialRoute: '/home',
              onGenerateRoute: (settings) => Routes.generateRoute(settings),
            ),
          ),
          const BottomNav(),
        ],
      ),
    );
  }
}
