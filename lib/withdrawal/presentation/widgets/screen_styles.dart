import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class WText extends StatelessWidget {
  final Color? color;
  final String title;
  final double? fontSize;
  final FontWeight? fontWeight;
  final TextAlign? textAlign;
  final bool softWrap;

  const WText(
      {super.key,
      this.color,
      required this.title,
      this.fontSize,
      this.fontWeight,
      this.textAlign,
      this.softWrap = false});

  @override
  Widget build(BuildContext context) {
    return Text(
      title,
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
