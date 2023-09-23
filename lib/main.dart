import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:free_lunch_app/pages/addAccountPage.dart';
import 'package:free_lunch_app/withdrawal/presentation/pages/withdraw_account.dart';
import 'package:free_lunch_app/withdrawal/presentation/pages/withdrawal_screen.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';

void main() {
  runApp(ProviderScope(child: const MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      home: WithdrawalScreen(),
      routes: {
        WithdrawalAccount.routeName: (context) => WithdrawalAccount(),
        AddAccountPage.routeName: (context) => AddAccountPage(),

        // Default route
      },
    );
  }
}
