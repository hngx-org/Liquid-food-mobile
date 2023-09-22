import 'package:flutter/material.dart';
import 'package:free_lunch_app/feature/utils/colors.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:iconly/iconly.dart';

class AuthInputPasswordContainer extends StatefulWidget {
  const AuthInputPasswordContainer({
    Key? key,
    required this.height,
    required this.hintText,
    this.iconData,
    required this.controller,
    this.validator,
  }) : super(key: key);

  final double height;
  final String hintText;
  final IconData? iconData;
  final TextEditingController controller;
  final String? Function(String?)? validator;

  @override
  _AuthInputPasswordContainerState createState() =>
      _AuthInputPasswordContainerState();
}

class _AuthInputPasswordContainerState
    extends State<AuthInputPasswordContainer> {
  bool _isPasswordVisible = false;

  final roundBorder = OutlineInputBorder(
    borderRadius: BorderRadius.circular(6),
  );

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: widget.controller,
      obscureText: !_isPasswordVisible,
      decoration: InputDecoration(
        contentPadding: const EdgeInsets.all(13),
        hintText: widget.hintText,
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
        suffixIcon: GestureDetector(
          child: Icon(
            _isPasswordVisible ? IconlyLight.show : IconlyLight.hide,
          ),
          onTap: () {
            setState(() {
              _isPasswordVisible = !_isPasswordVisible;
            });
          },
        ),
      ),
      validator: widget.validator,
    );
  }
}
