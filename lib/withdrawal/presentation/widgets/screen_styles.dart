import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class WText extends StatelessWidget {
  final Color? color;
  final String text;
  final double? fontSize;
  final double? height;
  final FontWeight? fontWeight;
  final TextAlign? textAlign;
  final bool softWrap;

  const WText(
      {super.key,
      this.color,
      required this.text,
      this.height,
      this.fontSize,
      this.fontWeight,
      this.textAlign,
      this.softWrap = false});

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: GoogleFonts.workSans(
        height: height,
        color: color,
        fontSize: fontSize,
        fontWeight: fontWeight,
      ),
      softWrap: softWrap,
      textScaleFactor: MediaQuery.textScaleFactorOf(context),
      textAlign: textAlign,
    );
  }
}

class WTextButton extends StatelessWidget {
  final Color? color;
  final String text;
  final double? fontSize;
  final double? height;
  final FontWeight? fontWeight;
  final TextAlign? textAlign;
  final bool softWrap;
  final VoidCallback onTap;

  const WTextButton(
      {super.key,
      this.color,
      required this.text,
      required this.onTap,
      this.height,
      this.fontSize,
      this.fontWeight,
      this.textAlign,
      this.softWrap = false});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Text(
        text,
        style: GoogleFonts.workSans(
          height: height,
          color: color,
          fontSize: fontSize,
          fontWeight: fontWeight,
        ),
        softWrap: softWrap,
        textScaleFactor: MediaQuery.textScaleFactorOf(context),
        textAlign: textAlign,
      ),
    );
  }
}
