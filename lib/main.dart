import 'package:flutter/material.dart';
import 'feature/screens/lunch.screen.dart';
import 'feature/screens/send.request.screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      // home: SendRequestPage(),
      home: SendLunches(totalLunches: '12',),
    );
  }
}