import 'package:flutter/material.dart';
import 'package:free_lunch_app/utils/routing/utlils.dart';
import 'package:provider/provider.dart';
import 'features/main/bottom_nav_shell.dart';
import 'features/main/navigation/providers/bottom_navigation.viewmodel.dart';

void main() {
  runApp(
    const MyApp(),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => NavItemProvider()),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          useMaterial3: true,
        ),
        initialRoute: '/',
        navigatorKey: Utils.mainAppNav,
        routes: {
          '/': (context) => const SplashPage(),
          '/home': (context) => const BottomNavShell(),
        },
      ),
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
