import 'package:flutter/material.dart';
// import 'package:free_lunch_app/feature/utils/colors.dart';
import '../../utils/utils/colors.dart';
import 'package:free_lunch_app/screens/widgets/widgets.dart';
import 'package:free_lunch_app/withdrawal/presentation/widgets/w_button.dart';
import 'package:iconly/iconly.dart';
import '../../withdrawal/presentation/widgets/screen_styles.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final TextEditingController _emailController = TextEditingController();

  final TextEditingController _passwordController = TextEditingController();

  bool obscure = true;

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
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: height * 0.1),
                Stack(
                  clipBehavior: Clip.none,
                  children: [
                    Align(
                      child: Image.asset(
                        'assets/images/burger-i.png',
                        width: width * 0.3,
                      ),
                    ),
                    Positioned(
                      bottom: height * 0.07,
                      left: width * 0.47,
                      child: Image.asset(
                        'assets/images/certificate_fill-1.png',
                        width: width * 0.2,
                      ),
                    ),
                    Positioned(
                      left: width * 0.2,
                      top: height * 0.06,
                      child: Image.asset(
                        'assets/images/certificate_fill.png',
                        width: width * 0.18,
                      ),
                    ),
                  ],
                ),
                SizedBox(height: height * 0.04),
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
                SizedBox(height: height * 0.03),
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
                  obscureText: obscure,
                  hintText: 'Enter your password',
                  suffixIcon: GestureDetector(
                    child: Icon(
                      obscure ? IconlyLight.hide : IconlyLight.show,
                    ),
                    onTap: () {
                      setState(() {
                        obscure = !obscure;
                      });
                    },
                  ),
                ),
                SizedBox(height: height * 0.18),
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
