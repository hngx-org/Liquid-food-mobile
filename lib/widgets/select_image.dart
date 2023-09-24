import 'package:flutter/material.dart';
import '../utils/utils/colors.dart';

// This is just a simple widget all you need to add is the width and height you want the Widget to be
// And an icons that'll be placed in the middle
class SelectCam extends StatelessWidget {
  final double width;
  final double height;
  final Widget icon;
  const SelectCam(
      {super.key,
      required this.width,
      required this.height,
      required this.icon});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: height,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(100),
        color: AppColors.tGray,
      ),
      alignment: Alignment.center,
      child: icon,
    );
  }
}
