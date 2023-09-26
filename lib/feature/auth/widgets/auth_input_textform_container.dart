// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../../utils/res/colors.dart';

// import '../../feature/utils/colors.dart';
class AuthInputTextFormContainer extends StatelessWidget {
  AuthInputTextFormContainer({
    super.key,
    required this.height,
    required this.hintText,
    this.isObsure = false,
    required this.controller,
    this.onChanged,
    this.validator,
    this.keyboardType,
    this.suffixIcon,
  });

  final double height;
  final dynamic keyboardType;
  final String hintText;
  final bool isObsure;
  final Widget? suffixIcon;
  final TextEditingController controller;
  final void Function(String)? onChanged;
  final String? Function(String?)? validator;
  List<TextInputFormatter>? inputFormatters;

  final roundBorder = OutlineInputBorder(
    borderRadius: BorderRadius.circular(6),
  );

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      validator: validator,
      inputFormatters: inputFormatters,
      onChanged: onChanged,
      obscureText: isObsure,
      keyboardType: keyboardType,
      decoration: InputDecoration(
        suffixIcon: suffixIcon,
        contentPadding: const EdgeInsets.all(13),
        enabledBorder: roundBorder.copyWith(
          borderSide: const BorderSide(
            color: Color(0xffBFBFBF),
          ),
          borderRadius: BorderRadius.circular(6),
        ),
        focusedBorder: roundBorder.copyWith(
          borderSide: const BorderSide(
            color: AppColors.primaryColor,
          ),
          borderRadius: BorderRadius.circular(6),
        ),
        errorBorder: roundBorder.copyWith(
          borderSide: const BorderSide(
            color: Colors.red,
          ),
          borderRadius: BorderRadius.circular(6),
        ),
        focusedErrorBorder: roundBorder.copyWith(
          borderSide: const BorderSide(
            color: Colors.red,
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
