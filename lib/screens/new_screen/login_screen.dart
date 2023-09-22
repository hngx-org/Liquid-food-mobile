import 'package:flutter/material.dart';
import 'package:free_lunch_app/feature/utils/colors.dart';
import 'package:free_lunch_app/feature/utils/svg_icons.dart';
import 'package:free_lunch_app/screens/widgets/widgets.dart';
import 'package:free_lunch_app/withdrawal/presentation/widgets/w_button.dart';
import '../../withdrawal/presentation/widgets/screen_styles.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final TextEditingController _emailController = TextEditingController();

  final TextEditingController _passwordController = TextEditingController();

  @override
  void dispose() {
    super.dispose();
    _emailController.dispose();
    _passwordController.dispose();
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
                Stack(
                  children: [
                    Image.asset('assets/images/img.png'),
                  ],
                ),
                SizedBox(height: height * 0.029),
                const WText(
                  softWrap: true,
                  text: 'Login',
                  fontSize: 45,
                  fontWeight: FontWeight.w700,
                  color: AppColors.primaryColor,
                ),
                SizedBox(height: height * 0.029),
                const WText(
                  text: 'Email address',
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
                  hintText: 'Enter your password',
                ),
                SizedBox(height: height * 0.2),
                WButton(
                  onTap: () => Navigator.pushNamed(context, '/home'),
                  title: 'Login',
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
