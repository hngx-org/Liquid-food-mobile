import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../feature/utils/colors.dart';

class AuthInputTextFormContainer extends StatelessWidget {
  AuthInputTextFormContainer(
      {super.key,
      required this.height,
      required this.hintText,
      this.isObsure,
      required this.controller,
      this.isEnabled,
      this.surfixIcon,
      this.onChanged});

  final double height;
  final String hintText;
  final bool? isObsure;
  final TextEditingController controller;
  final bool? isEnabled;
  final Widget? surfixIcon;
  final void Function(String)? onChanged;

  final roundBorder = OutlineInputBorder(
    borderRadius: BorderRadius.circular(6),
  );

  @override
  Widget build(BuildContext context) {
    return TextFormField(
        cursorColor: AppColors.tPrimaryColor,
        controller: controller,
        keyboardType: TextInputType.emailAddress,
        enabled: isEnabled,
        decoration: InputDecoration(
          suffixIcon: surfixIcon,
          contentPadding: const EdgeInsets.all(13),
          enabledBorder: roundBorder.copyWith(
            borderSide: const BorderSide(
              color: Color(0xffBFBFBF),
            ),
            borderRadius: BorderRadius.circular(6),
          ),
          disabledBorder: roundBorder.copyWith(
              borderSide: BorderSide(color: Color(0xffBFBFBF)),
              borderRadius: BorderRadius.circular(6)),
          focusedBorder: roundBorder.copyWith(
            borderSide: const BorderSide(
              color: AppColors.primaryColor,
            ),
            borderRadius: BorderRadius.circular(6),
          ),
          errorBorder: roundBorder.copyWith(
            borderSide: const BorderSide(
              color: AppColors.primaryColor,
            ),
            borderRadius: BorderRadius.circular(6),
          ),
          focusedErrorBorder: roundBorder.copyWith(
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
        onChanged: onChanged,
        autovalidateMode: AutovalidateMode.onUserInteraction,
        validator: (text) {
          if (text == null || text.isEmpty) {
            return "Text field can't be empty";
          }
          if (text.length < 4) {
            return "input should be 4 characters long or more";
          }
        });
  }
}
