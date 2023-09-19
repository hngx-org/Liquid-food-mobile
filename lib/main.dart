import 'package:flutter/material.dart';
import 'package:liquid_food_mobile/pages/addAccountPage.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: AddAccountPage(),
    );
  }
}

