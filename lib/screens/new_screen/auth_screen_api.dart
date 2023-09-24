// I attempt to see how I can implement the API 
// this file is a copy of auth_screen.dart but implemented differently
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:free_lunch_app/feature/utils/colors.dart';
import 'package:free_lunch_app/screens/widgets/widgets.dart';
import 'package:free_lunch_app/withdrawal/presentation/widgets/w_button.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:iconly/iconly.dart';

import '../../widgets/avatar.dart';
import '../../withdrawal/presentation/widgets/screen_styles.dart';

enum UserRole {
  admin,
  normalUser,
}

class AuthScreenAPI extends StatefulWidget {
  const AuthScreenAPI({super.key});

  @override
  _AuthScreenAPIState createState() => _AuthScreenAPIState();
}

class _AuthScreenAPIState extends State<AuthScreenAPI> {
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
  bool _isPasswordVisible = false;
  final bool _isConfirmPasswordVisible = false;
  bool isLogin = true;

  UserRole userRole = UserRole.admin;

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
            padding: EdgeInsets.symmetric(horizontal: width * 0.04),
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
                // if (!isLogin)
                //   Align(
                //     alignment: Alignment.center,
                //     child: AvatarComponent(
                //         image: const AssetImage('assets/images/dp.png'),
                //         width: width * .2,
                //         height: height * .11),
                //   ),
                // if (!isLogin) SizedBox(height: height * 0.019),
                // WText(
                //   softWrap: true,
                //   height: 1,
                //   textAlign: TextAlign.center,
                //   text: isLogin ? '' : 'Samuel invites you to join HNGx',
                //   fontSize: 32,
                //   fontWeight: FontWeight.w700,
                //   color: AppColors.primaryColor,
                // ),
                // if (!isLogin) SizedBox(height: height * 0.029),             
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
                 SizedBox(height: height * 0.008),
                if (!isLogin)   
                //  if (userRole == UserRole.normalUser && !isLogin) // Display for normal users only
                  Column(   //Display for normal users only
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
                        height: height,
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
                        text: 'OTP Token',
                        fontWeight: FontWeight.w500,
                        fontSize: 12,
                      ),
                      SizedBox(height: height * 0.008),
                      AuthInputTextFormContainer(
                        controller: _otpTokenController,
                        height: height,
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
                        height: height,
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
                        height: height,
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
                        height: height,
                        hintText: 'Enter your phone number',
                      ),
                    ],
                  ),

                SizedBox(height: height * 0.016),

                if (userRole == UserRole.admin && isLogin) // Display for admins only
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
                        height: height,
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
                        text: 'Phone number',
                        fontWeight: FontWeight.w500,
                        fontSize: 12,
                      ),
                      SizedBox(height: height * 0.008),
                      AuthInputTextFormContainer(
                        controller: _phoneNumberController,
                        height: height,
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
                        height: height,
                        hintText: 'Enter your organization name',
                      ),
                    ],
                  ),
                SizedBox(height: height * 0.040),
                // ... other UI elements
                WButton(
                  onTap: () => setState(() {
                    if (userRole == UserRole.admin) {
                      isLogin = !isLogin;
                    } else {
                      isLogin = true;
                    }
                  }),
                  title: isLogin ? 'Create Account' : 'Back to Login',
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
                      text: 'Toggle the button to switch to normal user',
                      fontWeight: FontWeight.w500,
                      fontSize: 12,
                    ),
                  ),
                if (!isLogin)
                if (userRole == UserRole.admin)
                  const Center(
                    child: WText(
                      text: 'Toggle the button to switch to admin user',
                      fontWeight: FontWeight.w500,
                      fontSize: 12,
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



// import 'package:flutter/material.dart';
// import 'package:google_fonts/google_fonts.dart';
// import 'package:flutter/material.dart';
// import 'package:free_lunch_app/feature/utils/colors.dart';
// import 'package:free_lunch_app/screens/widgets/widgets.dart';
// import 'package:free_lunch_app/withdrawal/presentation/widgets/w_button.dart';
// import 'package:google_fonts/google_fonts.dart';
// import 'package:iconly/iconly.dart';

// import '../../widgets/avatar.dart';
// import '../../withdrawal/presentation/widgets/screen_styles.dart';

// enum UserRole {
//   admin,
//   normalUser,
// }


// class AuthScreenAPI extends StatefulWidget {
//   const AuthScreenAPI({super.key});

//   @override
//   _AuthScreenAPIState createState() => _AuthScreenAPIState();
// }

// class _AuthScreenAPIState extends State<AuthScreenAPI> {
//   final _emailController = TextEditingController();
//   final _passwordController = TextEditingController();
//   final _confirmPasswordController = TextEditingController();
//   final _fullNameController = TextEditingController();
//   final _phoneNumberController = TextEditingController();
//   final _organizationNameController = TextEditingController();
//   final _otpTokenController = TextEditingController();
//   final _firstNameController = TextEditingController();
//   final _lastNameController = TextEditingController();
//   bool _isPasswordVisible = false;
//   final bool _isConfirmPasswordVisible = false;
//   bool isLogin = true;

//   UserRole userRole = UserRole.admin;
//   @override
//   void dispose() {
//     _emailController.dispose();
//     _passwordController.dispose();
//     _confirmPasswordController.dispose();
//     _fullNameController.dispose();
//     _phoneNumberController.dispose();
//     _organizationNameController.dispose();
//     _otpTokenController.dispose();
//     _firstNameController.dispose();
//     _lastNameController.dispose();
//     super.dispose();
//   }

// @override
// Widget build(BuildContext context) {
//   final height = MediaQuery.of(context).size.height;
//   final width = MediaQuery.of(context).size.width;
//   return Scaffold(
//     body: SafeArea(
//       child: SingleChildScrollView(
//         child: Padding(
//           padding: EdgeInsets.symmetric(horizontal: width * 0.04),
//           child: Column(
//             mainAxisAlignment: MainAxisAlignment.center,
//             crossAxisAlignment: CrossAxisAlignment.start,
//             children: [
//               // ... other UI elements

//               if (!isLogin) SizedBox(height: height * 0.1),
//                 SizedBox(height: height * 0.03),
//                 if (isLogin)
//                   Text(
//                     'Create an',
//                     style: GoogleFonts.workSans(
//                       height: 0.15,
//                       fontSize: 45,
//                       fontWeight: FontWeight.w700,
//                       color: AppColors.primaryColor,
//                     ),
//                   ),
//                 if (isLogin)
//                   const WText(
//                     text: 'account',
//                     fontSize: 45,
//                     fontWeight: FontWeight.w700,
//                     color: AppColors.primaryColor,
//                   ),

              
//                 if (!isLogin)
//                   Center(
//                     child: AvatarComponent(
//                         image: const AssetImage('assets/images/dp.png'),
//                         width: width * .2,
//                         height: height * .11),
//                   ),
//                 if (!isLogin) SizedBox(height: height * 0.029),
//                 WText(
//                   softWrap: true,
//                   height: 1,
//                   textAlign: TextAlign.center,
//                   text: isLogin ? '' : 'Samuel invites you to join HNGx',
//                   fontSize: 32,
//                   fontWeight: FontWeight.w700,
//                   color: AppColors.primaryColor,
//                 ),
//                 if (!isLogin) SizedBox(height: height * 0.029),
//                 Row(
//                   children: [
//                     Container(
//                       padding: const EdgeInsets.all(15),
//                       decoration: const BoxDecoration(
//                         shape: BoxShape.circle,
//                         color: Color(0xFFD9D9D9),
//                       ),
//                       child: const Icon(
//                         IconlyLight.camera,
//                         color: Colors.grey,
//                       ),
//                     ),
//                     SizedBox(width: width * 0.032),
//                     Container(
//                       padding: const EdgeInsets.all(8),
//                       decoration: BoxDecoration(
//                         borderRadius: BorderRadius.circular(8),
//                         border: Border.all(
//                           color: AppColors.primaryColor,
//                         ),
//                       ),
//                       child: const WText(
//                         text: 'Upload image',
//                         fontSize: 12,
//                         fontWeight: FontWeight.w500,
//                         color: AppColors.primaryColor,
//                       ),
//                     ),
//                   ],
//                 ),
//                 SizedBox(height: height * 0.016),
                
//               if (userRole == UserRole.admin) // Display for admins only
//                 Column(
//                   crossAxisAlignment: CrossAxisAlignment.start,
//                   children: [
//                     const WText(
//                       text: 'Email',
//                       fontWeight: FontWeight.w500,
//                       fontSize: 12,
//                     ),
//                     SizedBox(height: height * 0.008),
//                     AuthInputTextFormContainer(
//                       controller: _emailController,
//                       height: height,
//                       hintText: 'Enter your email address',
//                     ),
//                     SizedBox(height: height * 0.016),
//                     const WText(
//                       text: 'Password',
//                       fontWeight: FontWeight.w500,
//                       fontSize: 12,
//                     ),
//                     SizedBox(height: height * 0.008),
//                     AuthInputPasswordContainer(
//                       controller: _passwordController,
//                       height: height,
//                       obscureText: _isPasswordVisible,
//                       hintText: 'Enter your password',
//                       suffixIcon: GestureDetector(
//                         child: Icon(
//                           _isPasswordVisible ? IconlyLight.hide : IconlyLight.show,
//                         ),
//                         onTap: () {
//                           setState(() {
//                             _isPasswordVisible = !_isPasswordVisible;
//                           });
//                         },
//                       ),
//                     ),
//                     SizedBox(height: height * 0.016),
//                     const WText(
//                       text: 'Full name',
//                       fontWeight: FontWeight.w500,
//                       fontSize: 12,
//                     ),
//                     SizedBox(height: height * 0.008),
//                     AuthInputTextFormContainer(
//                       controller: _fullNameController,
//                       height: height,
//                       hintText: 'Enter your full name',
//                     ),
//                     SizedBox(height: height * 0.016),
//                     const WText(
//                       text: 'Phone number',
//                       fontWeight: FontWeight.w500,
//                       fontSize: 12,
//                     ),
//                     SizedBox(height: height * 0.008),
//                     AuthInputTextFormContainer(
//                       controller: _phoneNumberController,
//                       height: height,
//                       hintText: 'Enter your phone number',
//                     ),
//                     SizedBox(height: height * 0.016),
//                     const WText(
//                       text: 'Organization name',
//                       fontWeight: FontWeight.w500,
//                       fontSize: 12,
//                     ),
//                     SizedBox(height: height * 0.008),
//                     AuthInputTextFormContainer(
//                       controller: _organizationNameController,
//                       height: height,
//                       hintText: 'Enter your organization name',
//                     ),
//                   ],
//                 ),
//               if (userRole == UserRole.normalUser) // Display for normal users only
//                 Column(
//                   crossAxisAlignment: CrossAxisAlignment.start,
//                   children: [
//                     const WText(
//                       text: 'Email',
//                       fontWeight: FontWeight.w500,
//                       fontSize: 12,
//                     ),
//                     SizedBox(height: height * 0.008),
//                     AuthInputTextFormContainer(
//                       controller: _emailController,
//                       height: height,
//                       hintText: 'Enter your email address',
//                     ),
//                     SizedBox(height: height * 0.016),
//                     const WText(
//                       text: 'Password',
//                       fontWeight: FontWeight.w500,
//                       fontSize: 12,
//                     ),
//                     SizedBox(height: height * 0.008),
//                     AuthInputPasswordContainer(
//                       controller: _passwordController,
//                       height: height,
//                       obscureText: _isPasswordVisible,
//                       hintText: 'Enter your password',
//                       suffixIcon: GestureDetector(
//                         child: Icon(
//                           _isPasswordVisible ? IconlyLight.hide : IconlyLight.show,
//                         ),
//                         onTap: () {
//                           setState(() {
//                             _isPasswordVisible = !_isPasswordVisible;
//                           });
//                         },
//                       ),
//                     ),
//                     SizedBox(height: height * 0.016),
//                     const WText(
//                       text: 'OTP Token',
//                       fontWeight: FontWeight.w500,
//                       fontSize: 12,
//                     ),
//                     SizedBox(height: height * 0.008),
//                     AuthInputTextFormContainer(
//                       controller: _otpTokenController,
//                       height: height,
//                       hintText: 'Enter your OTP token',
//                     ),
//                     SizedBox(height: height * 0.016),
//                     const WText(
//                       text: 'First name',
//                       fontWeight: FontWeight.w500,
//                       fontSize: 12,
//                     ),
//                     SizedBox(height: height * 0.008),
//                     AuthInputTextFormContainer(
//                       controller: _firstNameController,
//                       height: height,
//                       hintText: 'Enter your first name',
//                     ),
//                     SizedBox(height: height * 0.016),
//                     const WText(
//                       text: 'Last name',
//                       fontWeight: FontWeight.w500,
//                       fontSize: 12,
//                     ),
//                     SizedBox(height: height * 0.008),
//                     AuthInputTextFormContainer(
//                       controller: _lastNameController,
//                       height: height,
//                       hintText: 'Enter your last name',
//                     ),
//                     SizedBox(height: height * 0.016),
//                     const WText(
//                       text: 'Phone number',
//                       fontWeight: FontWeight.w500,
//                       fontSize: 12,
//                     ),
//                     SizedBox(height: height * 0.008),
//                     AuthInputTextFormContainer(
//                       controller: _phoneNumberController,
//                       height: height,
//                       hintText: 'Enter your phone number',
//                     ),
//                   ],
//                 ),
//               SizedBox(height: height * 0.058),
//               // ... other UI elements
//               // WButton(
//               //     onTap: () => setState(() {
//               //       isLogin = !isLogin;
//               //     }),
//               //     title: isLogin ? 'Create Account' : 'Create Account',
//               //     color: AppColors.backgroundColor,
//               //   ),
//               WButton(
//                   onTap: () => setState(() {
//                     if (userRole == UserRole.admin) {
//                       isLogin = !isLogin;
//                     } else {
//                       isLogin = true;
//                     }
//                   }),
//                   title: isLogin ? 'Create Account' : 'Back to Login',
//                   color: AppColors.backgroundColor,
//                 ),
//                 SizedBox(height: height * 0.020),
//                 if (isLogin)
//                   GestureDetector(
//                     onTap: () => Navigator.pushNamed(context, '/log-in'),
//                     child: const Center(
//                       child: WText(
//                         text: 'I already have an account',
//                         fontSize: 12,
//                         fontWeight: FontWeight.w500,
//                         color: AppColors.primaryColor,
//                       ),
//                     ),
//                   ),
//                 if (!isLogin)
//                   ElevatedButton(
//                     onPressed: () {
//                       Navigator.pushNamed(context, '/');
//                     },
//                     child: const Text('Create Account'),
//                   ),
//                 if (!isLogin)
//                   ElevatedButton(
//                     onPressed: () {
//                       setState(() {
//                         userRole = UserRole.admin; // Toggle to admin role
//                       });
//                     },
//                     child: const Text('Switch to Admin'),
//                   ),
//                 if (userRole == UserRole.admin)
//                   const WText(
//                     text: 'Admin-specific Text',
//                     fontWeight: FontWeight.w500,
//                     fontSize: 12,
//                   ),

//             ],
//           ),
//         ),
//       ),
//     ),
//   );
// }
// }
//   @override
//   Widget build(BuildContext context) {
//     final height = MediaQuery.of(context).size.height;
//     final width = MediaQuery.of(context).size.width;
//     return Scaffold(
//       body: SafeArea(
//         child: SingleChildScrollView(
//           child: Padding(
//             padding: EdgeInsets.symmetric(horizontal: width * 0.04),
//             child: Column(
//               mainAxisAlignment: MainAxisAlignment.center,
//               crossAxisAlignment: CrossAxisAlignment.start,
//               children: [
//                 if (!_isLogin) SizedBox(height: height * 0.1),
//                 SizedBox(height: height * 0.03),
//                 if (_isLogin)
//                   Text(
//                     'Create an',
//                     style: GoogleFonts.workSans(
//                       height: 0.15,
//                       fontSize: 45,
//                       fontWeight: FontWeight.w700,
//                       color: AppColors.primaryColor,
//                     ),
//                   ),
//                 SizedBox(height: height * 0.008),
//                 if (_isLogin)
//                   const WText(
//                     text: 'Email',
//                     fontWeight: FontWeight.w500,
//                     fontSize: 12,
//                   ),
//                 SizedBox(height: height * 0.008),
//                 AuthInputTextFormContainer(
//                   controller: _emailController,
//                   height: height,
//                   hintText: 'Enter your email address',
//                 ),
//                 SizedBox(height: height * 0.016),
//                 const WText(
//                   text: 'Password',
//                   fontWeight: FontWeight.w500,
//                   fontSize: 12,
//                 ),
//                 SizedBox(height: height * 0.008),
//                 AuthInputPasswordContainer(
//                   controller: _passwordController,
//                   height: height,
//                   obscureText: _isPasswordVisible,
//                   hintText: 'Enter your password',
//                   suffixIcon: GestureDetector(
//                     child: Icon(
//                       _isPasswordVisible ? Icons.visibility : Icons.visibility_off,
//                     ),
//                     onTap: () {
//                       setState(() {
//                         _isPasswordVisible = !_isPasswordVisible;
//                       });
//                     },
//                   ),
//                 ),
//                 if (!_isLogin)
//                   Column(
//                     crossAxisAlignment: CrossAxisAlignment.start,
//                     children: [
//                       SizedBox(height: height * 0.016),
//                       const WText(
//                         text: 'Confirm Password',
//                         fontWeight: FontWeight.w500,
//                         fontSize: 12,
//                       ),
//                       SizedBox(height: height * 0.008),
//                       AuthInputPasswordContainer(
//                         controller: _confirmPasswordController,
//                         height: height,
//                         obscureText: _isConfirmPasswordVisible,
//                         hintText: 'Confirm your password',
//                         suffixIcon: GestureDetector(
//                           child: Icon(
//                             _isConfirmPasswordVisible ? Icons.visibility : Icons.visibility_off,
//                           ),
//                           onTap: () {
//                             setState(() {
//                               _isConfirmPasswordVisible = !_isConfirmPasswordVisible;
//                             });
//                           },
//                         ),
//                       ),
//                       SizedBox(height: height * 0.016),
//                       const WText(
//                         text: 'Full name',
//                         fontWeight: FontWeight.w500,
//                         fontSize: 12,
//                       ),
//                       SizedBox(height: height * 0.008),
//                       AuthInputTextFormContainer(
//                         controller: _fullNameController,
//                         height: height,
//                         hintText: 'Enter your full name',
//                       ),
//                       SizedBox(height: height * 0.016),
//                       const WText(
//                         text: 'Phone number',
//                         fontWeight: FontWeight.w500,
//                         fontSize: 12,
//                       ),
//                       SizedBox(height: height * 0.008),
//                       AuthInputTextFormContainer(
//                         controller: _phoneNumberController,
//                         height: height,
//                         hintText: 'Enter your phone number',
//                       ),
//                       SizedBox(height: height * 0.016),
//                       const WText(
//                         text: 'Organization name',
//                         fontWeight: FontWeight.w500,
//                         fontSize: 12,
//                       ),
//                       SizedBox(height: height * 0.008),
//                       AuthInputTextFormContainer(
//                         controller: _organizationNameController,
//                         height: height,
//                         hintText: 'Enter your organization name',
//                       ),
//                     ],
//                   ),
//                 if (_isLogin)
//                   SizedBox(height: height * 0.016),
//                 if (_isLogin)
//                   Row(
//                     mainAxisAlignment: MainAxisAlignment.end,
//                     children: [
//                       GestureDetector(
//                         onTap: () {
//                           setState(() {
//                             _isLogin = false;
//                           });
//                         },
//                         child: const WText(
//                           text: 'Create an account',
//                           fontWeight: FontWeight.w500,
//                           fontSize: 12,
//                         ),
//                       ),
//                     ],
//                   ),
//                 if (!_isLogin)
//                   SizedBox(height: height * 0.016),
//                 if (!_isLogin)
//                   Row(
//                     mainAxisAlignment: MainAxisAlignment.end,
//                     children: [
//                       GestureDetector(
//                         onTap: () {
//                           setState(() {
//                             _isLogin = true;
//                           });
//                         },
//                         child: const WText(
//                           text: 'Already have an account? Login',
//                           fontWeight: FontWeight.w500,
//                           fontSize: 12,
//                         ),
//                       ),
//                     ],
//                   ),
//                 SizedBox(height: height * 0.058),
//                 // ... other UI elements
//               ],
//             ),
//           ),
//         ),
//       ),
//     );
//   }
// }