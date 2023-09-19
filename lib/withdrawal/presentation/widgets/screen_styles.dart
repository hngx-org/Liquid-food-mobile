import 'package:flutter/material.dart';

class WText extends StatelessWidget {
  final Color? color;
  final String title;
  final TextStyle? style;

  const WText({super.key, this.color, required this.title, this.style});

  @override
  Widget build(BuildContext context) {
    return Text(
      title,
      style: style,
      textScaleFactor: MediaQuery.textScaleFactorOf(context),
    );
  }
}
