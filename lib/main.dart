import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'withdrawal/presentation/pages/withdraw_account.dart';
import 'withdrawal/presentation/pages/withdrawal_screen.dart';
import 'withdrawal/presentation/providers/withdraw_page_provider.dart';

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
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (_) => WithdrawView(),
        ),
      ],
      child: MaterialApp(
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
      ),
    );
  }
}
