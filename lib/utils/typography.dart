import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:free_lunch_app/feature/utils/colors.dart';

class AppTypography {
  static TextStyle headline4 = GoogleFonts.workSans(
      fontSize: 32.0,
      fontWeight: FontWeight.w700,
      color: AppColors.tPrimaryColor,
      height: 0.5);

  static TextStyle subHeader2 = GoogleFonts.workSans(
    fontSize: 16.0,
    fontWeight: FontWeight.w500,
    color: AppColors.commentShade,
    height: 1,
  );

  static TextStyle subHeader3 = GoogleFonts.workSans(
    fontSize: 16.0,
    fontWeight: FontWeight.w400,
    color: AppColors.tBlack4,
  );

  static TextStyle title = GoogleFonts.workSans(
      fontSize: 45.0,
      fontWeight: FontWeight.w700,
      color: AppColors.tPrimaryColor,
      height: 0.4);

  static TextStyle subTitle3 = GoogleFonts.workSans(
    fontSize: 10.0,
    fontWeight: FontWeight.w400,
    color: AppColors.tBlack4,
    height: 1.6,
  );

  static TextStyle bodyText1 = GoogleFonts.workSans(
    fontSize: 16.0,
    fontWeight: FontWeight.normal,
    color: AppColors.tBlack,
  );

  static TextStyle bodyText2 = GoogleFonts.workSans(
    fontSize: 16.0,
    fontWeight: FontWeight.w400,
    color: Colors.grey,
    height: 1.6,
  );

  static TextStyle bodyText3 = GoogleFonts.workSans(
    fontSize: 12.0,
    fontWeight: FontWeight.w400,
    color: AppColors.commentShade,
    height: 1.3,
  );

  static TextStyle bodyText3Blue = GoogleFonts.workSans(
    fontSize: 12.0,
    fontWeight: FontWeight.w400,
    color: AppColors.tPrimaryColor,
    height: 1.3,
  );

  static TextStyle smallButtonText = GoogleFonts.workSans(
    fontSize: 14.0,
    fontWeight: FontWeight.w400,
    color: Colors.white,
    height: 1.1,
  );

  static TextStyle bigButtonText = GoogleFonts.workSans(
    fontSize: 16.0,
    fontWeight: FontWeight.w500,
    color: Colors.white,
    height: 1,
  );

  static TextStyle button2Text = GoogleFonts.workSans(
    fontSize: 16.0,
    fontWeight: FontWeight.w500,
    color: Colors.white,
    height: 1,
  );

  static TextStyle button4Text = GoogleFonts.workSans(
    fontSize: 12.0,
    fontWeight: FontWeight.w500,
    color: AppColors.tPrimaryColor,
    height: 1.3,
  );
  // Define more typography styles as needed
  static TextStyle subHeader4 = GoogleFonts.workSans(
    fontSize: 16.0,
    fontWeight: FontWeight.w500,
    color: AppColors.shadeTextColor,
    height: 1,
  );

  static TextStyle title1 = GoogleFonts.workSans(
    fontSize: 25.0,
    fontWeight: FontWeight.w500,
    color: AppColors.tBlack,
    height: 1,
  );

  static TextStyle title3 = GoogleFonts.workSans(
      fontSize: 65.0,
      fontWeight: FontWeight.w700,
      color: AppColors.tPrimaryColor,
      height: 0.4);
}