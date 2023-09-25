import 'package:flutter/material.dart';
import 'package:free_lunch_app/utils/res/colors.dart';
import 'package:google_fonts/google_fonts.dart';

class AuthInputTextFormContainer extends StatelessWidget {
  const AuthInputTextFormContainer({
    super.key,
    required this.hintText,
    required this.controller,
  });

  final String hintText;
  final TextEditingController controller;

  @override
  Widget build(BuildContext context) {
    final roundBorder = OutlineInputBorder(
      borderRadius: BorderRadius.circular(6),
    );
    return TextFormField(
      controller: controller,
      keyboardType: TextInputType.emailAddress,
      decoration: InputDecoration(
        isCollapsed: true,
        isDense: true,
        contentPadding: const EdgeInsets.all(13),
        hintText: hintText,
        hintStyle: GoogleFonts.workSans(
          fontSize: 12,
          fontWeight: FontWeight.w400,
          color: const Color(0xFFA6A6A6),
        ),
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
      ),
    );
  }
}
