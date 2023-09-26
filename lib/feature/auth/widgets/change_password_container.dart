import 'package:flutter/material.dart';

class ChangePasswordContainer extends StatefulWidget {
  const ChangePasswordContainer({
    Key? key,
    required this.height,
    required this.hintText,
    required this.iconData,
    required this.controller,
    this.validator,
    required this.focus,
  }) : super(key: key);

  final double height;
  final FocusNode focus;
  final String hintText;
  final IconData iconData;
  final TextEditingController controller;
  final String? Function(String?)? validator;

  @override
  _ChangePasswordContainerState createState() =>
      _ChangePasswordContainerState();
}

class _ChangePasswordContainerState extends State<ChangePasswordContainer> {
  final bool _isPasswordVisible = false;

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
        focusNode: widget.focus,
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
          suffixIcon: TextButton(
            // onPressed: widget.onPressed,
            onPressed: () {},
            child: Text(
              'Change Password',
              style: TextStyle(
                color: Theme.of(context).primaryColor,
                fontSize: 12,
                fontWeight: FontWeight.w500,
              ),
            ),
          ),
        ),
        validator: widget.validator,
      ),
    );
  }
}
