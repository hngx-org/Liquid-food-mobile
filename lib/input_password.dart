import 'package:flutter/material.dart';
class AuthInputPasswordContainer extends StatelessWidget {
  const AuthInputPasswordContainer({
    super.key,
    required this.height,
    required this.hintText,
    required this.iconData,
    required this.controller, this.validator,
  });

  final double height;
  final String hintText;
  final IconData iconData;
  final TextEditingController controller;
  final Function(String value)? validator;

  @override
  Widget build(BuildContext context) {
    return Container(
        height: height * 0.060,
        width: double.infinity,
        padding: const EdgeInsets.symmetric(horizontal: 16),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(6),
          border: Border.all(color: const Color(0xFF0085FF)),
        ),
        child: TextFormField(
          
         
          obscureText: true,
          decoration: InputDecoration(
            border: InputBorder.none,
            hintText: hintText,
            hintStyle: const TextStyle(
              fontSize: 10,
              fontWeight: FontWeight.w400,
              color: Color(0xFFA6A6A6),
            ),
            suffixIcon: Icon(iconData),
          ),
        ));
  }
}
