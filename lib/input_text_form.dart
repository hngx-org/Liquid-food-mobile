import 'package:flutter/material.dart';
class AuthInputTextFormContainer extends StatelessWidget {
  const AuthInputTextFormContainer({
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
         
          controller: controller,
          keyboardType: TextInputType.emailAddress,
          decoration: InputDecoration(
              border: InputBorder.none,
              hintText: hintText,
              hintStyle: const TextStyle(
                fontSize: 10,
                fontWeight: FontWeight.w400,
                color: Color(0xFFA6A6A6),
              )),
        ));
  }
}
