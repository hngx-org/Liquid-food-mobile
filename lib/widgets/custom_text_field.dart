import 'package:flutter/material.dart';
import 'package:free_lunch_app/utils/colors.dart';

class CustomTextField extends StatelessWidget {
  const CustomTextField({
    Key? key,
    required this.textController,
    required this.textFocus,
    required this.isPassword,
    required this.leadingIcon,
    required this.hintText,
    required this.validator,
    required this.isMultiLine,
    required this.onSubmitted,
  }) : super(key: key);

  final TextEditingController textController;
  final FocusNode textFocus;
  final bool isPassword;
  final Icon leadingIcon;
  final bool isMultiLine;
  final String hintText;
  final String? Function(String?) validator;
  final void Function(String) onSubmitted;

  @override
  Widget build(BuildContext context) {
    final ValueNotifier<bool> obscurePassword = ValueNotifier(true);
    return isPassword
        ? ValueListenableBuilder(
            valueListenable: obscurePassword,
            builder: (context, value, child) {
              return TextFormField(
                focusNode: textFocus,
                controller: textController,
                validator: validator,
                obscureText: obscurePassword.value,
                decoration: InputDecoration(
                  hintText: 'Password',
                  fillColor: Colors.grey[100],
                  filled: true,
                  prefixIcon: const Icon(Icons.lock_outline),
                  suffixIcon: InkWell(
                      onTap: () {
                        obscurePassword.value = !obscurePassword.value;
                      },
                      child: Icon(obscurePassword.value
                          ? Icons.visibility_off_outlined
                          : Icons.visibility_outlined)),
                  focusedBorder: OutlineInputBorder(
                    borderSide: const BorderSide(color: Colors.black),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderSide: const BorderSide(color: Color(0xffE4E7EB)),
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
              );
            })
        : TextFormField(
            maxLength: (isMultiLine) ? 250 : null,
            maxLines: (isMultiLine) ? 8 : 1,
            focusNode: textFocus,
            controller: textController,
            validator: validator,
            onFieldSubmitted: onSubmitted,
            decoration: InputDecoration(
              prefixIcon: leadingIcon,
              floatingLabelAlignment: FloatingLabelAlignment.start,
              labelStyle: const TextStyle(fontWeight: FontWeight.w400),
              contentPadding: const EdgeInsets.all(10),
              isCollapsed: true,
              hintText: hintText,
              hintStyle:
                  const TextStyle(fontSize: 12, color: Color(0xff8C8C8C)),
              fillColor: Colors.grey[100],
              filled: true,
              focusedBorder: OutlineInputBorder(
                borderSide: const BorderSide(color: AppColors.primaryColor),
                borderRadius: BorderRadius.circular(10),
              ),
              enabledBorder: OutlineInputBorder(
                borderSide: const BorderSide(color: Color(0xff8C8C8C)),
                borderRadius: BorderRadius.circular(10),
              ),
            ),
          );
  }
}
