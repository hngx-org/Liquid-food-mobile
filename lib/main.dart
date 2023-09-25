import 'package:flutter/material.dart';
import 'package:free_lunch_app/feature/auth/viewmodels/create_acct_viewmodel.dart';
import 'package:free_lunch_app/feature/lunches/presentation/lunches_view_model.dart';
import 'package:free_lunch_app/features/create_account/create_account.dart';
import 'package:free_lunch_app/features/home/view_model/home_viewmodel.dart';
import 'package:free_lunch_app/features/login/view/login.dart';
import 'package:free_lunch_app/features/login/viewmodels/login.viewmodel.dart';
import 'package:free_lunch_app/features/login/viewmodels/user.viewmodel.dart';
import 'package:free_lunch_app/features/sendLunches/viewmodel/sendlunch.viewmodel.dart';
import 'package:free_lunch_app/utils/routing/utlils.dart';
import 'package:free_lunch_app/withdrawal/presentation/pages/withdraw_account.dart';
import 'package:free_lunch_app/withdrawal/presentation/pages/withdrawal_screen.dart';
import 'package:provider/provider.dart';
import '../features/main/view/bottom_nav_shell.dart';
import '../features/main/navigation/providers/bottom_navigation.viewmodel.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => NavItemProvider()),
        ChangeNotifierProvider(create: (_) => HomeRepoVM()),
        ChangeNotifierProvider(create: (_) => SendLunchVM()),
        ChangeNotifierProvider(create: (_) => LoginViewModel()),
        ChangeNotifierProvider(create: (_) => UserViewModel()),
        ChangeNotifierProvider(create: (_) => LunchesViewModel()),
        ChangeNotifierProvider(create: (_) => CreatAcctViewModel()),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          useMaterial3: true,
        ),
        initialRoute: '/',
        navigatorKey: Utils.mainAppNav,
        routes: {
          '/': (context) => const AuthLoginScreen(),
          '/signup': (context) => const CreateAccount(),
          '/login': (context) => const AuthLoginScreen(),
          '/home': (context) => const BottomNavShell(),
          '/withdrawal': (context) => const WithdrawalScreen(),
          '/withdrawalAccount': (context) => const WithdrawalAccount(),
        },
      ),
      // home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class SplashPage extends StatelessWidget {
  const SplashPage({super.key});

  @override
  Widget build(BuildContext context) {
    final user = context.read<UserViewModel>();
    Future.delayed(const Duration(seconds: 2), () {
      if (user.accessToken == null || user.accessToken!.isNotEmpty) {
        Utils.mainAppNav.currentState?.pushReplacementNamed('/login');
      } else {
        Utils.mainAppNav.currentState?.pushReplacementNamed('/home');
      }
    });
    return const Scaffold(
      body: Center(
        child: Text('Splash'),
      ),
    );
  }
}
