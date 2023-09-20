import 'package:flutter/material.dart';
import 'package:free_lunch_app/features/main/bottom_nav.dart';
import 'package:free_lunch_app/utils/routing/routes.dart';
import 'package:free_lunch_app/utils/routing/utlils.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

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
