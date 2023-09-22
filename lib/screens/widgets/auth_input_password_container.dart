import 'package:flutter/material.dart';


class AuthInputPasswordContainer extends StatefulWidget {
  const AuthInputPasswordContainer({
    Key? key,
    required this.height,
    required this.hintText,
    required this.iconData,
    required this.controller,
    this.validator,
  }) : super(key: key);

  final double height;
  final String hintText;
  final IconData iconData;
  final TextEditingController controller;
  final String? Function(String?)? validator;

  @override
  _AuthInputPasswordContainerState createState() =>
      _AuthInputPasswordContainerState();
}

class _AuthInputPasswordContainerState extends State<AuthInputPasswordContainer> {
  bool _isPasswordVisible = false;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: widget.height * 0.060,
      width: double.infinity,
      padding: const EdgeInsets.symmetric(horizontal: 16),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(6),
        border: Border.all(color: const Color(0xFF0085FF)),
      ),
      child: TextFormField(
        controller: widget.controller,
        obscureText: !_isPasswordVisible,
        decoration: InputDecoration(
          border: InputBorder.none,
          hintText: widget.hintText,
          hintStyle: const TextStyle(
            fontSize: 10,
            fontWeight: FontWeight.w400,
            color: Color(0xFFA6A6A6),
          ),
          suffixIcon: IconButton(
            icon: Icon(
              _isPasswordVisible ? Icons.visibility : Icons.visibility_off,
            ),
            onPressed: () {
              setState(() {
                _isPasswordVisible = !_isPasswordVisible;
              });
            },
          ),
        ),
        validator: widget.validator,
      ),
    );
  }
}