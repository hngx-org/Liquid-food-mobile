import 'package:flutter/material.dart';
import '../feature/utils/colors.dart';
import '../feature/utils/typography.dart';

// This file contains all buttons used in the design
// and parameters that can help to customize it to better suit the design


class MiniActionBtn extends StatelessWidget {
  final VoidCallback onTap;
  final Color? btnColor;
  final Widget? icon;
  final String text;
  const MiniActionBtn(
      {super.key, required this.onTap, this.btnColor, this.icon, required this.text});

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    return GestureDetector(
      onTap: onTap,
      child: FittedBox(
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
          decoration: BoxDecoration(
            color: btnColor ?? AppColors.tPrimaryColor,
            borderRadius: BorderRadius.circular(30),
          ),
          child: Row(
            children: <Widget>[
              icon ?? const SizedBox(),
              SizedBox(width: width * .02),
              Text(
                text,
                style: TextStyle(
                  color: AppColors.tWhite,
                  fontSize: width * .01 + 14,
                  fontWeight: FontWeight.normal,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class MediumActionBtn extends StatelessWidget {
  final Color? btnColor;
  final Widget? icon;
  final String text;
  const MediumActionBtn(
      {super.key, this.btnColor, this.icon, required this.text});

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    return FittedBox(
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
        decoration: BoxDecoration(
          color: btnColor ?? AppColors.tPrimaryColor,
          borderRadius: BorderRadius.circular(30),
        ),
        child: Row(
          children: <Widget>[
            icon ?? const SizedBox(),
            SizedBox(width: width * .02),
            Text(
              text,
              style: TextStyle(
                color: AppColors.tWhite,
                fontSize: width * .01 + 14,
                fontWeight: FontWeight.w600,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class ActionBtn extends StatelessWidget {
  final Color? btnColor;
  final Widget? icon;
  final String text;
  final double? widthM;
  const ActionBtn(
      {super.key, this.btnColor, this.icon, required this.text, this.widthM});

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    return Container(
      height: 56,
      width: widthM,
      constraints: BoxConstraints(minWidth: width * .5),
      padding: const EdgeInsets.symmetric(vertical: 12),
      decoration: BoxDecoration(
        color: btnColor ?? AppColors.tPrimaryColor,
        borderRadius: BorderRadius.circular(32),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          icon ?? const SizedBox(),
          SizedBox(width: width * .02),
          Text(
            text,
            style: AppTypography.button2Text,
          ),
        ],
      ),
    );
  }
}

class MiniOutlinedActionBtn extends StatelessWidget {
  final Color? btnColor;
  final Color? textColor;
  final Widget? icon;
  final String text;
  const MiniOutlinedActionBtn(
      {super.key,
      this.btnColor,
      this.icon,
      required this.text,
      this.textColor});

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    return FittedBox(
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
        decoration: BoxDecoration(
          border: Border.all(
            color: btnColor ?? AppColors.tPrimaryColor,
          ),
          borderRadius: BorderRadius.circular(10),
        ),
        child: Row(
          children: <Widget>[
            icon ?? const SizedBox(),
            SizedBox(width: width * .02),
            Text(
              text,
              style: TextStyle(
                color: textColor,
                fontSize: width * .01 + 14,
                fontWeight: FontWeight.normal,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
