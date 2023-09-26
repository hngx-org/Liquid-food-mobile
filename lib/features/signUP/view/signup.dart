// I attempt to see how I can implement the API
// this file is a copy of auth_screen.dart but implemented differently
import 'package:flutter/material.dart';
import 'package:free_lunch_app/features/signUP/repositories/signup.repo.dart';
import 'package:free_lunch_app/utils/routing/utlils.dart';
import 'package:google_fonts/google_fonts.dart';
// import 'package:free_lunch_app/feature/utils/colors.dart';
import 'package:free_lunch_app/withdrawal/presentation/widgets/w_button.dart';
// import 'package:google_fonts/google_fonts.dart';
import 'package:iconly/iconly.dart';
// import '../../widgets/avatar.dart';
import '../../../withdrawal/presentation/widgets/screen_styles.dart';
import 'package:logger/logger.dart';
import '../../../screens/widgets/auth_input_password_container.dart';
import '../../../screens/widgets/auth_input_textform_container.dart';
import '../../../utils/utils/colors.dart';
import '../../signUP/model/signup_model.dart';

enum UserRole {
  admin,
  normalUser,
}

class SignScreenAPI extends StatefulWidget {
  const SignScreenAPI({super.key});

  @override
  _SignScreenAPIState createState() => _SignScreenAPIState();
}

class _SignScreenAPIState extends State<SignScreenAPI> {
  final _emailController = TextEditingController();
  final _userEmailController = TextEditingController();
  final _passwordController = TextEditingController();
  final _confirmPasswordController = TextEditingController();
  final _fullNameController = TextEditingController();
  final _phoneNumberController = TextEditingController();
  // final _userOTPController = TextEditingController();
  final _organizationNameController = TextEditingController();
  final _otpTokenController = TextEditingController();
  final _firstNameController = TextEditingController();
  final _lastNameController = TextEditingController();
  final GlobalKey<State> _key = GlobalKey<State>();

  bool _isPasswordVisible = false;
  // final bool _isConfirmPasswordVisible = false;
  bool isLogin = true;

  UserRole userRole = UserRole.admin;
  var logger = Logger();

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    _confirmPasswordController.dispose();
    _fullNameController.dispose();
    _phoneNumberController.dispose();
    _organizationNameController.dispose();
    _otpTokenController.dispose();
    _firstNameController.dispose();
    _lastNameController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.symmetric(
                horizontal: width * 0.04, vertical: height * .04),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // ... other UI elements

                // if (!isLogin) SizedBox(height: height * 0.1),
                SizedBox(height: height * 0.03),
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
                    text: 'Admin account',
                    fontSize: 45,
                    fontWeight: FontWeight.w700,
                    color: AppColors.primaryColor,
                  ),

                if (!isLogin)
                  Text(
                    'Create a',
                    style: GoogleFonts.workSans(
                      height: 0.15,
                      fontSize: 45,
                      fontWeight: FontWeight.w700,
                      color: AppColors.primaryColor,
                    ),
                  ),
                if (!isLogin)
                  const WText(
                    text: 'Staff account',
                    fontSize: 45,
                    fontWeight: FontWeight.w700,
                    color: AppColors.primaryColor,
                  ),
                SizedBox(height: height * 0.008),
                if (!isLogin)
                  //  if (userRole == UserRole.normalUser && !isLogin) // Display for normal users only
                  Column(
                    //Display for normal users only
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const WText(
                        text: 'Email',
                        fontWeight: FontWeight.w500,
                        fontSize: 12,
                      ),
                      SizedBox(height: height * 0.008),
                      AuthInputTextFormContainer(
                        controller: _userEmailController,
                        hintText: 'Enter your email address',
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
                        obscureText: _isPasswordVisible,
                        hintText: 'Enter your password',
                        suffixIcon: GestureDetector(
                          child: Icon(
                            _isPasswordVisible
                                ? IconlyLight.hide
                                : IconlyLight.show,
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
                        text: 'OTP Token',
                        fontWeight: FontWeight.w500,
                        fontSize: 12,
                      ),
                      SizedBox(height: height * 0.008),
                      AuthInputTextFormContainer(
                        controller: _otpTokenController,
                        hintText: 'Enter your OTP token',
                      ),
                      SizedBox(height: height * 0.016),
                      const WText(
                        text: 'First name',
                        fontWeight: FontWeight.w500,
                        fontSize: 12,
                      ),
                      SizedBox(height: height * 0.008),
                      AuthInputTextFormContainer(
                        controller: _firstNameController,
                        hintText: 'Enter your first name',
                      ),
                      SizedBox(height: height * 0.016),
                      const WText(
                        text: 'Last name',
                        fontWeight: FontWeight.w500,
                        fontSize: 12,
                      ),
                      SizedBox(height: height * 0.008),
                      AuthInputTextFormContainer(
                        controller: _lastNameController,
                        hintText: 'Enter your last name',
                      ),
                      SizedBox(height: height * 0.016),
                      const WText(
                        text: 'Phone number',
                        fontWeight: FontWeight.w500,
                        fontSize: 12,
                      ),
                      SizedBox(height: height * 0.008),
                      AuthInputTextFormContainer(
                        controller: _phoneNumberController,
                        hintText: 'Enter your phone number',
                      ),
                    ],
                  ),

                SizedBox(height: height * 0.016),

                if (userRole == UserRole.admin &&
                    isLogin) // Display for admins only
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const WText(
                        text: 'Email',
                        fontWeight: FontWeight.w500,
                        fontSize: 12,
                      ),
                      SizedBox(height: height * 0.008),
                      AuthInputTextFormContainer(
                        controller: _emailController,
                        hintText: 'Enter your email address',
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
                        obscureText: _isPasswordVisible,
                        hintText: 'Enter your password',
                        suffixIcon: GestureDetector(
                          child: Icon(
                            _isPasswordVisible
                                ? IconlyLight.hide
                                : IconlyLight.show,
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
                        text: 'Full name',
                        fontWeight: FontWeight.w500,
                        fontSize: 12,
                      ),
                      SizedBox(height: height * 0.008),
                      AuthInputTextFormContainer(
                        controller: _fullNameController,
                        hintText: 'Enter your full name',
                      ),
                      SizedBox(height: height * 0.016),
                      const WText(
                        text: 'Phone number',
                        fontWeight: FontWeight.w500,
                        fontSize: 12,
                      ),
                      SizedBox(height: height * 0.008),
                      AuthInputTextFormContainer(
                        controller: _phoneNumberController,
                        hintText: 'Enter your phone number',
                      ),
                      SizedBox(height: height * 0.016),
                      const WText(
                        text: 'Organization name',
                        fontWeight: FontWeight.w500,
                        fontSize: 12,
                      ),
                      SizedBox(height: height * 0.008),
                      AuthInputTextFormContainer(
                        controller: _organizationNameController,
                        hintText: 'Enter your organization name',
                      ),
                    ],
                  ),
                SizedBox(height: height * 0.040),

                WButton(
                  onTap: () async {
                    if (isLogin) {
                      // Code for creating an admin account
                      final signupModel = SignupModel(
                        email: _emailController.text,
                        password: _passwordController.text,
                        fullName: _fullNameController.text,
                        phoneNumber: _phoneNumberController.text,
                        organizationName: _organizationNameController.text,
                        isAdmin: true,
                      );
                      final userRepository = SignupRepository();
                      final user =
                          await userRepository.signup(signupModel, context);
                      setState(() {
                        _emailController.clear();
                        _passwordController.clear();
                        _fullNameController.clear();
                        _phoneNumberController.clear();
                        _organizationNameController.clear();
                        isLogin =
                            false; // Update the isLogin variable to toggle to "Back to Create Admin"
                      });
                      showDialog(
                        context: _key.currentContext!,
                        builder: (BuildContext context) {
                          return AlertDialog(
                            title: const Text('Success'),
                            // content: Text(user.message),
                            content: Text(user.message ?? ''),
                            actions: [
                              TextButton(
                                onPressed: () {
                                  Navigator.of(context).pop();
                                },
                                child: const Text('OK'),
                              ),
                            ],
                          );
                        },
                      );
                    } else {
                      // Code for creating a staff account
                      final signupModel = SignupModel(
                        email: _emailController.text,
                        password: _passwordController.text,
                        otpToken: _otpTokenController.text,
                        firstName: _firstNameController.text,
                        lastName: _lastNameController.text,
                        phoneNumber: _phoneNumberController.text,
                        isAdmin: false,
                      );
                      final userRepository = SignupRepository();
                      final user =
                          await userRepository.signup(signupModel, context);
                      setState(() {
                        _emailController.clear();
                        _passwordController.clear();
                        _otpTokenController.clear();
                        _firstNameController.clear();
                        _lastNameController.clear();
                        _phoneNumberController.clear();
                        isLogin =
                            true; // Update the isLogin variable to toggle to "Create Account"
                      });
                    }
                    setState(() {
                      isLogin = !isLogin;
                    });
                  },
                  title: isLogin ? 'Create Account' : 'Back to Create Admin',
                  color: AppColors.backgroundColor,
                ),
                SizedBox(height: height * 0.020),
                if (isLogin)
                  GestureDetector(
                    onTap: () =>
                        Utils.mainAppNav.currentState?.pushNamed('/login'),
                    child: const Center(
                      child: WText(
                        text: 'I already have an account',
                        fontSize: 12,
                        fontWeight: FontWeight.w500,
                        color: AppColors.primaryColor,
                      ),
                    ),
                  ),
                SizedBox(height: height * 0.015),

                // if (!isLogin)
                //   ElevatedButton(
                //     onPressed: () {
                //       Navigator.pushNamed(context, '/');
                //     },
                //     child: const Text('Create Account'),
                //   ),
                // if (!isLogin)
                //   ElevatedButton(
                //     onPressed: () {
                //       setState(() {
                //         userRole = UserRole.admin; // Toggle to admin role
                //       });
                //     },
                //     child: const Text('Switch to Admin'),
                //   ),
                if (isLogin)
                  if (userRole == UserRole.admin)
                    const Center(
                      child: WText(
                        text: 'Proceed to login after creating account',
                        fontWeight: FontWeight.w500,
                        fontSize: 12,
                      ),
                    ),
                if (!isLogin)
                  if (userRole == UserRole.admin)
                    WButton(
                      onTap: () => setState(() {
                        if (userRole == UserRole.admin) {
                          isLogin = !isLogin;
                        } else {
                          isLogin = true;
                        }
                      }),
                      title: isLogin ? 'Create Account' : 'Back to Admin Login',
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
