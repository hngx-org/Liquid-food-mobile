import 'package:flutter/material.dart';
import 'package:free_lunch_app/screens/new_screen/profile_page.dart';


import 'screens/screens.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: ProfileImagePage()
    );
  }
}
