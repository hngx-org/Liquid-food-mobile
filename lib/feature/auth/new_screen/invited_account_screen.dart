import 'package:flutter/material.dart';
import '../../../utils/res/colors.dart';
import 'package:free_lunch_app/feature/auth/widgets/widgets.dart';
import 'package:free_lunch_app/withdrawal/presentation/widgets/w_button.dart';

import 'package:iconly/iconly.dart';

import '../../../widgets/avatar.dart';
import '../../../withdrawal/presentation/widgets/screen_styles.dart';

class InvitedAccountScreen extends StatefulWidget {
  const InvitedAccountScreen({super.key});

  @override
  State<InvitedAccountScreen> createState() => _InvitedAccountScreenState();
}

class _InvitedAccountScreenState extends State<InvitedAccountScreen> {
  final TextEditingController _fullNameController = TextEditingController();

  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _confirmPasswordController =
      TextEditingController();
  bool isLogin = true;

  bool _isPasswordVisible = true;

  @override
  void dispose() {
    super.dispose();
    _fullNameController.dispose();

    _passwordController.dispose();
    _confirmPasswordController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: width * 0.04),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: height * 0.12),

                Center(
                  child: AvatarComponent(
                      image: const AssetImage('assets/images/dp.png'),
                      width: width * .2,
                      height: height * .11),
                ),
                SizedBox(height: height * 0.029),
                const WText(
                  softWrap: true,
                  height: 1,
                  textAlign: TextAlign.center,
                  text: 'Samuel invites you to join HNGx',
                  fontSize: 32,
                  fontWeight: FontWeight.w700,
                  color: AppColors.primaryColor,
                ),
                SizedBox(height: height * 0.029),
                // if (isLogin)
                Row(
                  children: [
                    Container(
                      padding: const EdgeInsets.all(15),
                      decoration: const BoxDecoration(
                        shape: BoxShape.circle,
                        color: Color(0xFFD9D9D9),
                      ),
                      child: const Icon(
                        IconlyLight.camera,
                        color: Colors.grey,
                      ),
                    ),
                    SizedBox(width: width * 0.032),
                    Container(
                      padding: const EdgeInsets.all(8),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(8),
                        border: Border.all(
                          color: AppColors.primaryColor,
                        ),
                      ),
                      child: const WText(
                        text: 'Upload image',
                        fontSize: 12,
                        fontWeight: FontWeight.w500,
                        color: AppColors.primaryColor,
                      ),
                    ),
                  ],
                ),

                SizedBox(height: height * 0.016),

                const WText(
                  text: 'Full name',
                  fontWeight: FontWeight.w500,
                  fontSize: 12,
                ),
                SizedBox(height: height * 0.008),

                AuthInputTextFormContainer(
                  controller: _fullNameController,
                  height: height,
                  hintText: 'Enter your full name',
                ),

                SizedBox(height: height * 0.016),
                const WText(
                  text: 'Password',
                  fontWeight: FontWeight.w500,
                  fontSize: 12,
                ),
                SizedBox(height: height * 0.008),
                AuthInputPasswordContainer(
                  controller: _passwordController,
                  height: height,
                  obscureText: _isPasswordVisible,
                  hintText: 'Enter your password',
                  suffixIcon: GestureDetector(
                    child: Icon(
                      _isPasswordVisible ? IconlyLight.hide : IconlyLight.show,
                    ),
                    onTap: () {
                      setState(() {
                        _isPasswordVisible = !_isPasswordVisible;
                      });
                    },
                  ),
                ),
                // if (isLogin)
                SizedBox(height: height * 0.016),

                const WText(
                  text: 'Confirm Password',
                  fontWeight: FontWeight.w500,
                  fontSize: 12,
                ),

                SizedBox(height: height * 0.008),

                AuthInputPasswordContainer(
                  controller: _confirmPasswordController,
                  height: height,
                  obscureText: _isPasswordVisible,
                  hintText: 'Enter your confirm password',
                  suffixIcon: GestureDetector(
                    child: Icon(
                      _isPasswordVisible ? IconlyLight.hide : IconlyLight.show,
                    ),
                    onTap: () {
                      setState(() {
                        _isPasswordVisible = !_isPasswordVisible;
                      });
                    },
                  ),
                ),
                SizedBox(height: height * 0.058),
                WButton(
                  onTap: () =>
                      Navigator.pushReplacementNamed(context, '/log-in'),
                  title: 'Create Account',
                  color: AppColors.backgroundColor,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
