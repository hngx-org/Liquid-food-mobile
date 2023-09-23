import 'package:flutter/material.dart';

import 'package:google_fonts/google_fonts.dart';
import 'package:iconly/iconly.dart';

import '../../utils/res/colors.dart';
import '../../withdrawal/presentation/widgets/screen_styles.dart';
import '../../withdrawal/presentation/widgets/w_button.dart';
import '../widgets/widgets.dart';

class AuthScreen extends StatefulWidget {
  const AuthScreen({super.key});

  @override
  State<AuthScreen> createState() => _AuthScreenState();
}

class _AuthScreenState extends State<AuthScreen> {
  final TextEditingController _fullNameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _organizationNameController =
      TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _confirmPasswordController =
      TextEditingController();
  bool isLogin = true;

  bool _isPasswordVisible = true;

  @override
  void dispose() {
    super.dispose();
    _fullNameController.dispose();
    _emailController.dispose();
    _organizationNameController.dispose();
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
                SizedBox(height: height * 0.03),
                Text(
                  'Create an',
                  style: GoogleFonts.workSans(
                    height: 0.15,
                    fontSize: 45,
                    fontWeight: FontWeight.w700,
                    color: AppColors.primaryColor,
                  ),
                ),
                const WText(
                  text: 'account',
                  fontSize: 45,
                  fontWeight: FontWeight.w700,
                  color: AppColors.primaryColor,
                ),
                SizedBox(height: height * 0.029),
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
                  text: 'Organization email',
                  fontWeight: FontWeight.w500,
                  fontSize: 12,
                ),
                SizedBox(
                  height: height * 0.008,
                ),
                AuthInputTextFormContainer(
                  controller: _emailController,
                  height: height,
                  hintText: 'Enter your email address',
                ),
                SizedBox(height: height * 0.016),
                const WText(
                  text: 'Organization name',
                  fontWeight: FontWeight.w500,
                  fontSize: 12,
                ),
                SizedBox(
                  height: height * 0.008,
                ),
                AuthInputTextFormContainer(
                  controller: _organizationNameController,
                  height: height,
                  hintText: 'Enter your organization name',
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
                      Navigator.pushReplacementNamed(context, '/invite-screen'),
                  title: 'Create Account',
                  color: AppColors.backgroundColor,
                ),
                SizedBox(height: height * 0.020),
                if (isLogin)
                  GestureDetector(
                    onTap: () => Navigator.pushNamed(context, '/log-in'),
                    child: const Center(
                      child: WText(
                        text: 'I already have an account',
                        fontSize: 12,
                        fontWeight: FontWeight.w500,
                        color: AppColors.primaryColor,
                      ),
                    ),
                  ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
