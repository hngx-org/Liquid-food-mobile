import 'package:flutter/material.dart';
import 'package:free_lunch_app/feature/utils/colors.dart';
import 'package:free_lunch_app/screens/widgets/widgets.dart';
import 'package:free_lunch_app/withdrawal/presentation/widgets/w_button.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:iconly/iconly.dart';

import '../../widgets/avatar.dart';
import '../../withdrawal/presentation/widgets/screen_styles.dart';

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
                if (!isLogin) SizedBox(height: height * 0.1),
                SizedBox(height: height * 0.03),
                // if (!isLogin)
                // Row(
                //   mainAxisAlignment: MainAxisAlignment.center,
                //   children: [
                //     Image.asset(
                //       'assets/images/burger.png',
                //       width: 200,
                //     )
                //   ],
                // ),
                if (isLogin)
                  Text(
                    'Create an',
                    style: GoogleFonts.workSans(
                      height: 0.15,
                      fontSize: 45,
                      fontWeight: FontWeight.w700,
                      color: AppColors.primaryColor,
                    ),
                  ),
                if (isLogin)
                  const WText(
                    text: 'account',
                    fontSize: 45,
                    fontWeight: FontWeight.w700,
                    color: AppColors.primaryColor,
                  ),

                if (!isLogin)
                  Center(
                    child: AvatarComponent(
                        image: const AssetImage('assets/images/dp.png'),
                        width: width * .2,
                        height: height * .11),
                  ),
                if (!isLogin) SizedBox(height: height * 0.029),
                WText(
                  softWrap: true,
                  height: 1,
                  textAlign: TextAlign.center,
                  text: isLogin ? '' : 'Samuel invites you to join HNGx',
                  fontSize: 32,
                  fontWeight: FontWeight.w700,
                  color: AppColors.primaryColor,
                ),
                if (!isLogin) SizedBox(height: height * 0.029),
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
                // if (isLogin)
                SizedBox(height: height * 0.016),
                // if (isLogin)
                WText(
                  text: isLogin ? 'Full name' : 'Full name',
                  fontWeight: FontWeight.w500,
                  fontSize: 12,
                ),
                if (isLogin) SizedBox(height: height * 0.008),

                AuthInputTextFormContainer(
                  controller: _fullNameController,
                  height: height,
                  hintText: 'Enter your full name',
                ),
                if (isLogin) SizedBox(height: height * 0.016),
                if (isLogin)
                  WText(
                    text: isLogin ? 'Organization email' : 'Email address',
                    fontWeight: FontWeight.w500,
                    fontSize: 12,
                  ),
                if (isLogin)
                  SizedBox(
                    height: height * 0.008,
                  ),
                if (isLogin)
                  AuthInputTextFormContainer(
                    controller: _emailController,
                    height: height,
                    hintText: 'Enter your email address',
                  ),
                if (isLogin)
                  SizedBox(
                    height: height * 0.016,
                  ),
                if (isLogin)
                  const WText(
                    text: 'Organization name',
                    fontWeight: FontWeight.w500,
                    fontSize: 12,
                  ),
                if (isLogin)
                  SizedBox(
                    height: height * 0.008,
                  ),
                if (isLogin)
                  AuthInputTextFormContainer(
                    controller: _organizationNameController,
                    height: height,
                    hintText: 'Enter your organization name',
                  ),
                SizedBox(
                  height: height * 0.016,
                ),
                const WText(
                  text: 'Password',
                  fontWeight: FontWeight.w500,
                  fontSize: 12,
                ),
                SizedBox(
                  height: height * 0.008,
                ),
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
                // if (isLogin)
                const WText(
                  text: 'Confirm Password',
                  fontWeight: FontWeight.w500,
                  fontSize: 12,
                ),
                // if (isLogin)
                SizedBox(height: height * 0.008),
                // if (isLogin)
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
                  onTap: () => setState(() {
                    isLogin = !isLogin;
                  }),
                  title: isLogin ? 'Create Account' : 'Create Account',
                  color: AppColors.backgroundColor,
                ),
                // GestureDetector(
                //   onTap: () => setState(() {
                //     isLogin = !isLogin;
                //   }),
                //   child: Container(
                //     alignment: Alignment.center,
                //     padding: const EdgeInsets.only(
                //       top: 16,
                //       left: 24,
                //       bottom: 16,
                //       right: 24,
                //     ),
                //     height: height * 0.080,
                //     width: double.infinity,
                //     decoration: BoxDecoration(
                //         borderRadius: BorderRadius.circular(32),
                //         color: const Color(0xFF0085FF)),
                //     child: Text(
                //       isLogin ? 'Create Account' : 'Login',
                //       style: const TextStyle(
                //           fontWeight: FontWeight.w500,
                //           fontSize: 16,
                //           color: Colors.white),
                //     ),
                //   ),
                // ),
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
