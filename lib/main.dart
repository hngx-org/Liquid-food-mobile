import 'package:flutter/material.dart';
import 'package:free_lunch_app/feature/auth/viewmodels/create_acct_viewmodel.dart';
import 'package:free_lunch_app/feature/lunches/presentation/lunches_view_model.dart';
import 'package:free_lunch_app/feature/auth/viewmodels/login.viewmodel.dart';
import 'package:free_lunch_app/feature/auth/pages/auth_screen.dart';
import 'package:free_lunch_app/feature/auth/pages/invited_account_screen.dart';
import 'package:free_lunch_app/feature/auth/pages/login_screen.dart';
import 'package:free_lunch_app/feature/auth/pages/profile_page.dart';
import 'package:free_lunch_app/withdrawal/presentation/pages/withdraw_account.dart';
import 'package:free_lunch_app/withdrawal/presentation/pages/withdrawal_screen.dart';
import '../features/home/view_model/home_viewmodel.dart';
import '../features/sendLunches/viewmodel/sendlunch.viewmodel.dart';
import '../../feature/utils/routing/utlils.dart';
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
        ChangeNotifierProvider(create: (_) => LunchesViewModel()),
        ChangeNotifierProvider(create: (_) => LoginViewModel()),
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
          '/': (context) => const AuthScreen(),
          '/home': (context) => const BottomNavShell(),
          '/withdrawal-screen': (_) => const WithdrawalScreen(),
          '/profile': (_) => const ProfileImagePage(),
          '/withdraw-account': (_) => const WithdrawalAccount(),
          '/log-in': (_) => const LoginScreen(),
          '/invite-screen': (_) => const InvitedAccountScreen(),
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
    Future.delayed(const Duration(seconds: 2), () {
      Navigator.pushReplacementNamed(context, '/home');
    });
    return const Scaffold(
      body: Center(
        child: Text('Splash'),
      ),
    );
  }
}
