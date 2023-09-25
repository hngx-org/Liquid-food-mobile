import 'package:flutter/material.dart';
import 'package:free_lunch_app/feature/lunches/presentation/lunches_view_model.dart';
import 'package:free_lunch_app/features/signUP/view/signup.dart';
import 'package:free_lunch_app/screens/new_screen/auth_screen.dart';
import 'package:free_lunch_app/screens/new_screen/auth_screen_api.dart';
import 'package:free_lunch_app/screens/new_screen/change_password_screen.dart';
import 'package:free_lunch_app/screens/new_screen/login_screen.dart';
import 'package:free_lunch_app/screens/new_screen/profile_page.dart';
import 'package:free_lunch_app/withdrawal/presentation/pages/withdraw_account.dart';
import 'package:free_lunch_app/withdrawal/presentation/pages/withdrawal_screen.dart';
import '../features/home/view_model/home_viewmodel.dart';
import '../features/sendLunches/viewmodel/sendlunch.viewmodel.dart';
import 'package:free_lunch_app/features/create_account/create_account.dart';
import 'package:free_lunch_app/features/login/view/login.dart';
import 'package:free_lunch_app/features/login/viewmodels/login.viewmodel.dart';
import 'package:free_lunch_app/features/login/viewmodels/user.viewmodel.dart';
import 'package:free_lunch_app/utils/routing/utlils.dart';
import 'package:provider/provider.dart';
import '../features/main/view/bottom_nav_shell.dart';
import '../features/main/navigation/providers/bottom_navigation.viewmodel.dart';
import '../feature/lunches/presentation/lunches_view.dart';

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
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          useMaterial3: true,
        ),
        initialRoute: '/',
        navigatorKey: Utils.mainAppNav,
        routes: {
          // '/': (context) => const AuthScreen(),
          // '/': (context) => const AuthScreenAPI(),
          '/signup': (context) => const SignScreenAPI(),
          // '/signup': (context) => const AuthScreenAPI(),
          '/home': (context) => const BottomNavShell(),
          '/lunches': (context) => const LunchesView(),
          '/profile': (context) => const ProfileImagePage(),
          '/withdrawal-screen': (_) => const WithdrawalScreen(),
          '/withdraw-account': (_) => const WithdrawalAccount(),
          '/change-password': (_) => const ChangePasswordScreen(),
          // '/log-in': (_) => const LoginScreen(),
          // '/log-in': (_)  => const AuthLoginScreen(),
          '/': (context) => const SplashPage(),
          // '/signup': (context) => const CreateAccount(),
          '/log-in': (context) => const AuthLoginScreen(),
          // '/home': (context) => const BottomNavShell(),
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
        Navigator.pushReplacementNamed(context, '/signup');
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
