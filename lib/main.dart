import 'package:flutter/material.dart';
import 'package:free_lunch_app/withdrawal/presentation/pages/withdraw_account.dart';
import 'withdrawal/presentation/pages/withdrawal_screen.dart';

void main() {
  runApp(
    const MyApp(),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const WithdrawalScreen(),
      //
      routes: {
        WithdrawalAccount.routeName: (ctx) => const WithdrawalAccount(),
      },
    );
  }
}
