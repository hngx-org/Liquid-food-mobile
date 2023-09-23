import 'package:flutter/material.dart';
import '../../widgets/action_buttons.dart';
import '../../feature/utils/colors.dart';

class ChangePasswordScreen extends StatefulWidget {
  const ChangePasswordScreen({Key? key}) : super(key: key);

  @override
  _ChangePasswordScreenState createState() => _ChangePasswordScreenState();
}

class _ChangePasswordScreenState extends State<ChangePasswordScreen> {
  final _formKey = GlobalKey<FormState>();
  final _oldPasswordController = TextEditingController();
  final _newPasswordController = TextEditingController();
  final _confirmPasswordController = TextEditingController();

  final bool _isPasswordVisible = false;

  void _handleSaveChanges() {
    if (_formKey.currentState!.validate()) {
      // TODO: Implement password change logic
    }
  }

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;

    return Scaffold(
      appBar: AppBar(
        title: const Text('Change Password'),
      ),
      body: SafeArea(
        child: Column(
          children: [
            const SizedBox(height: 150,),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Form(
                key: _formKey,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      'Old Password',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 16,
                      ),
                    ),
                    SizedBox(height: height * 0.01),
                    ChangePasswordContainer(
                      controller: _oldPasswordController,
                      height: height,
                      hintText: 'Enter old password',
                      iconData: _isPasswordVisible
                          ? Icons.visibility_outlined
                          : Icons.visibility_off_outlined,
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please enter old password';
                        }
                        return null;
                      },
                    ),
                    SizedBox(height: height * 0.02),
                    const Text(
                      'New Password',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 16,
                      ),
                    ),
                    SizedBox(height: height * 0.01),
                    ChangePasswordContainer(
                      controller: _newPasswordController,
                      height: height,
                      hintText: 'Enter new password',
                      iconData: _isPasswordVisible
                          ? Icons.visibility_outlined
                          : Icons.visibility_off_outlined,
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please enter new password';
                        }
                        return null;
                      },
                    ),
                    SizedBox(height: height * 0.02),
                    const Text(
                      'Confirm Password',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 16,
                      ),
                    ),
                    SizedBox(height: height * 0.01),
                    ChangePasswordContainer(
                      controller: _confirmPasswordController,
                      height: height,
                      hintText: 'Confirm new password',
                      iconData: _isPasswordVisible
                          ? Icons.visibility_outlined
                          : Icons.visibility_off_outlined,
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please confirm new password';
                        }
                        if (value != _newPasswordController.text) {
                          return 'Passwords do not match';
                        }
                        return null;
                      },
                    ),
                    SizedBox(height: height * 0.02),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        ActionBtn3(
                          text: 'Save Changes',
                          btnColor: AppColors.tPrimaryColor,
                          widthM: width * .9,
                          onTap: _handleSaveChanges,
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class ChangePasswordContainer extends StatefulWidget {
  const ChangePasswordContainer({
    Key? key,
    required this.controller,
    required this.height,
    required this.hintText,
    required this.iconData,
    required this.validator,
  }) : super(key: key);

  final TextEditingController controller;
  final double height;
  final String hintText;
  final IconData iconData;
  final String? Function(String?) validator;

  @override
  _ChangePasswordContainerState createState() =>
      _ChangePasswordContainerState();
}

class _ChangePasswordContainerState extends State<ChangePasswordContainer> {
  bool _isPasswordVisible = false;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: widget.controller,
      obscureText: !_isPasswordVisible,
      decoration: InputDecoration(
        contentPadding: const EdgeInsets.all(13),
        hintText: widget.hintText,
        hintStyle: const TextStyle(
          fontSize: 12,
          fontWeight: FontWeight.w400,
          color: Color(0xFFA6A6A6),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(6),
          borderSide: const BorderSide(
            color: Color(0xffBFBFBF),
          ),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(6),
          borderSide: const BorderSide(
            color: AppColors.primaryColor,
          ),
        ),
        suffixIcon: GestureDetector(
          onTap: () {
            setState(() {
              _isPasswordVisible = !_isPasswordVisible;
            });
          },
          child: Icon(
            widget.iconData,
            color: const Color(0xFFA6A6A6),
          ),
        ),
      ),
      validator: widget.validator,
    );
  }
}