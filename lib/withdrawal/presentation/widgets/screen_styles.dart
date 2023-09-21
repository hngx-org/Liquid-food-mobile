import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class WText extends StatelessWidget {
  final Color? color;
  final String text;
  final double? fontSize;
  final FontWeight? fontWeight;
  final TextAlign? textAlign;
  final bool softWrap;

  const WText(
      {super.key,
      this.color,
      required this.text,
      this.fontSize,
      this.fontWeight,
      this.textAlign,
      this.softWrap = false});

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: GoogleFonts.workSans(
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
