import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../feature/utils/colors.dart';

class AuthInputTextFormContainer extends StatelessWidget {
  AuthInputTextFormContainer({
    super.key,
    required this.height,
    required this.hintText,
    this.isObsure,
    required this.controller,
  });

  final double height;
  final String hintText;
  final bool? isObsure;
  final TextEditingController controller;

  final roundBorder = OutlineInputBorder(
    borderRadius: BorderRadius.circular(6),
  );

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      keyboardType: TextInputType.emailAddress,
      decoration: InputDecoration(
        contentPadding: const EdgeInsets.all(13),
        enabledBorder: roundBorder.copyWith(
          borderSide: const BorderSide(
            color: AppColors.primaryColor,
          ),
          borderRadius: BorderRadius.circular(6),
        ),
        focusedBorder: roundBorder.copyWith(
          borderSide: const BorderSide(
            color: AppColors.primaryColor,
          ),
          borderRadius: BorderRadius.circular(6),
        ),
        hintText: hintText,
        hintStyle: GoogleFonts.workSans(
          fontSize: 12,
          fontWeight: FontWeight.w400,
          color: const Color(0xFFA6A6A6),
        ),
      ),
    );
  }
}
