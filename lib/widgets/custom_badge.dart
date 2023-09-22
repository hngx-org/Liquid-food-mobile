import 'package:flutter/material.dart';

// This widget is used to display bage icons
// There are two types of widgets that I can be created wit this code base
// The first is an outlined bage icon widget or a filled bage icon widget

// Use case
// To create an outlined bage icon widget you'll need to provide a value for the outlineColor variable and an icon
// To create a filled bage icon widget you'll need  to provide a value for the filledColor variable and an icon

// Note you only need to provide either a value for the filledColor variable or a value for the outlineColor variable
class CustomBadgeIcon extends StatelessWidget {
  final Widget icon;
  final Color? filledColor;
  final Color? outlineColor;
  const CustomBadgeIcon(
      {super.key, required this.icon, this.filledColor, this.outlineColor});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(8),
      decoration: BoxDecoration(
        color: filledColor,
        borderRadius: BorderRadius.circular(100),
        border: outlineColor != null
            ? Border.all(
                color: outlineColor!,
                width: 1.2,
              )
            : null,
      ),
      child: icon,
    );
  }
}
