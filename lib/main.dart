import 'package:flutter/material.dart';
import 'package:free_lunch_app/feature/lunches/presentation/lunches_view_model.dart';
import 'package:free_lunch_app/screens/new_screen/auth_screen.dart';
import 'package:free_lunch_app/screens/new_screen/change_password_screen.dart';
import 'package:free_lunch_app/screens/new_screen/login_screen.dart';
import 'package:free_lunch_app/screens/new_screen/profile_page.dart';
import 'package:free_lunch_app/withdrawal/presentation/pages/withdraw_account.dart';
import 'package:free_lunch_app/withdrawal/presentation/pages/withdrawal_screen.dart';
import '../features/home/view_model/home_viewmodel.dart';
import '../features/sendLunches/viewmodel/sendlunch.viewmodel.dart';
import '../../feature/utils/routing/utlils.dart';
import 'package:provider/provider.dart';
import '../features/main/view/bottom_nav_shell.dart';
import '../features/main/navigation/providers/bottom_navigation.viewmodel.dart';
import '../feature/lunches/presentation/lunches_view_model.dart';
import '../feature/lunches/presentation/lunches_view.dart';
import 'package:free_lunch_app/screens/new_screen/profile_page.dart';

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
        ChangeNotifierProvider(create: (_) => LunchesViewModel())
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
          '/lunches': (context) => const LunchesView(),
          '/profile': (context) => const ProfileImagePage(),
          '/withdrawal-screen': (_) => const WithdrawalScreen(),
          '/withdraw-account': (_) => const WithdrawalAccount(),
          '/change-password': (_) => const ChangePasswordScreen(),
          '/log-in': (_) => const LoginScreen(),
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
