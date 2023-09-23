import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:free_lunch_app/screens/screens.dart';
import 'package:free_lunch_app/screens/widgets/change_password_container.dart';
import 'package:free_lunch_app/screens/widgets/widgets.dart';

import '../../feature/utils/colors.dart';
import '../../feature/utils/icons.dart';
import '../../feature/utils/typography.dart';
import '../../widgets/action_buttons.dart';
import '../../widgets/avatar.dart';

class ProfileImagePage extends StatefulWidget {
  const ProfileImagePage({Key? key}) : super(key: key);

  @override
  _ProfileImagePageState createState() => _ProfileImagePageState();
}

class _ProfileImagePageState extends State<ProfileImagePage> {
  final TextEditingController _fullNameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final bool _isPasswordVisible = false;

  @override
  void dispose() {
    _fullNameController.dispose();
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;

    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Stack(
                children: [
                  Container(
                    width: width,
                    height: height * 0.3,
                    // width: double.infinity,
                    decoration: const BoxDecoration(
                      image: DecorationImage(
                          image: AssetImage('assets/images/banner.png'),
                          fit: BoxFit.cover),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.end,
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: <Widget>[
                          Container(
                            width: 42,
                            height: 42,
                            padding: const EdgeInsets.all(8),
                            // margin: EdgeInsets.all(10),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(4),
                              color: Colors.white,
                            ),
                            alignment: Alignment.center,
                            child: IconButton(
                              icon: const Icon(
                                CupertinoIcons.camera,
                                color: AppColors.tBlack,
                              ),
                              padding: const EdgeInsets.all(0),
                              onPressed: () {
                                // Handle camera icon press here
                              },
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
              // SizedBox(height: height * 0.02),
              Row(
                children: [
                  const Padding(
                    padding:
                        EdgeInsets.symmetric(horizontal: 16.0, vertical: 1),
                    child: AvatarComponent(
                      image: AssetImage('assets/images/dp.png'),
                      width: 64,
                      height: 64,
                    ),
                  ),
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.only(right: 16.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text(
                            'John Doe',
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 16,
                            ),
                          ),
                          SizedBox(height: height * 0.01),
                          const Text(
                            'Software Engineer',
                            style: TextStyle(
                              fontWeight: FontWeight.normal,
                              fontSize: 10,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  TextButton(
                    onPressed: () {
                      // Handle edit icon press here
                    },
                    child: const Text('Edit'),
                  ),
                ],
              ),
              SizedBox(height: height * 0.02),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      'Full Name',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 16,
                      ),
                    ),
                    SizedBox(height: height * 0.01),
                    AuthInputTextFormContainer(
                      controller: _fullNameController,
                      height: height,
                      hintText: 'Enter your full name',
                    ),
                    SizedBox(height: height * 0.02),
                    const Text(
                      'Email Address',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 16,
                      ),
                    ),
                    SizedBox(height: height * 0.01),
                    AuthInputTextFormContainer(
                      controller: _emailController,
                      height: height,
                      hintText: 'Enter your email address',
                    ),
                    SizedBox(height: height * 0.02),
                    const Text(
                      'Password',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 16,
                      ),
                    ),
                    SizedBox(height: height * 0.01),
                    ChangePasswordContainer(
                      controller: _passwordController,
                      height: height,
                      hintText: 'Enter current password',
                      iconData: _isPasswordVisible
                          ? Icons.visibility_outlined
                          : Icons.visibility_off_outlined,
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please enter current password';
                        }
                        return null;
                      },
                    ),
                    SizedBox(height: height * 0.02),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        ActionBtn(
                          text: 'Invite co-worker',
                          btnColor: AppColors.tPrimaryColor,
                          widthM: width * .9,
                        )
                        // Expanded(
                        //   child: ElevatedButton(
                        //     onPressed: () {
                        //       // Handle invite co-worker press here
                        //     },
                        //     child: const Text('Invite Co-worker'),
                        //   ),
                        // ),
                      ],
                    ),
                  ],
                ),
              ),
              SizedBox(height: height * 0.02),
            ],
          ),
        ),
      ),
    );
  }
}


class ProfileImagePageMain extends StatefulWidget {
  const ProfileImagePageMain({Key? key}) : super(key: key);

  @override
  _ProfileImagePageMainState createState() => _ProfileImagePageMainState();
}

class _ProfileImagePageMainState extends State<ProfileImagePageMain> {
  final TextEditingController _fullNameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final bool _isPasswordVisible = false;

  void _handleInviteCoWorker() {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => const InvitedAccountScreen()),
    );
  }

  @override
  void dispose() {
    _fullNameController.dispose();
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: SafeArea(
        child: SizedBox(
          width: width,
          height: height,
          child: Stack(
            children: [
              Positioned(
                child: Container(
                  width: width,
                  height: height * .3,
                  decoration: const BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage('assets/images/banner.png'),
                      fit: BoxFit.cover,
                    ),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.end,
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: <Widget>[
                        Container(
                          width: 42,
                          height: 42,
                          padding: const EdgeInsets.all(8),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(4),
                            color: Colors.white,
                          ),
                          alignment: Alignment.center,
                          child: IconButton(
                            icon: const Icon(
                              CupertinoIcons.camera,
                              color: AppColors.tBlack,
                            ),
                            padding: const EdgeInsets.all(0),
                            onPressed: () {
                              // Handle camera icon press here
                            },
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              Positioned(
                bottom: 0,
                child: SizedBox(
                  width: width,
                  height: height * .73,
                  child: Column(
                    children: <Widget>[
                      Row(
                        children: [
                          Padding(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 16.0, vertical: 1),
                            child: AvatarComponent(
                              image: const AssetImage('assets/images/dp.png'),
                              width: 80,
                              height: 80,
                              borderRadius: BorderRadius.circular(10),
                            ),
                          ),
                          Expanded(
                            child: Padding(
                              padding:
                                  EdgeInsets.only(right: 16.0, top: height * .04),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.end,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    'John Doe',
                                    style: TextStyle(
                                      fontSize: width * .01 + 16,
                                      fontWeight: FontWeight.w500,
                                      color: AppColors.tBlack,
                                      fontFamily: 'WorkSans',
                                      height: 1,
                                    ),
                                  ),
                                  const Text(
                                    'Software Engineer',
                                    style: TextStyle(
                                      fontWeight: FontWeight.normal,
                                      fontSize: 10,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                          Padding(
                            padding:
                                EdgeInsets.only(top: height * .05, right: 10),
                            child: const MiniOutlinedActionBtn(
                              text: 'Edit image',
                              btnColor: AppColors.tPrimaryColor,
                              textColor: AppColors.tPrimaryColor,
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: height * 0.02),
                      Expanded(
                        child: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 16.0),
                          child: SingleChildScrollView(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                const Text(
                                  'Full Name',
                                  style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 16,
                                  ),
                                ),
                                SizedBox(height: height * 0.01),
                                AuthInputTextFormContainer(
                                  controller: _fullNameController,
                                  height: height,
                                  hintText: 'Enter your full name',
                                ),
                                SizedBox(height: height * 0.02),
                                const Text(
                                  'Email Address',
                                  style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 16,
                                  ),
                                ),
                                SizedBox(height: height * 0.01),
                                AuthInputTextFormContainer(
                                  controller: _emailController,
                                  height: height,
                                  hintText: 'Enter your email address',
                                ),
                                SizedBox(height: height * 0.02),
                                const Text(
                                  'Password',
                                  style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 16,
                                  ),
                                ),
                                SizedBox(height: height * 0.01),
                                ChangePasswordContainer(
                                  controller: _passwordController,
                                  height: height,
                                  hintText: 'Enter current password',
                                  iconData: _isPasswordVisible
                                      ? Icons.visibility_outlined
                                      : Icons.visibility_off_outlined,
                                  validator: (value) {
                                    if (value == null || value.isEmpty) {
                                      return 'Please enter current password';
                                    }
                                    return null;
                                  },
                                ),
                                SizedBox(height: height * 0.02),
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    ActionBtn3(
                                      text: 'Invite co-worker',
                                      btnColor: AppColors.tPrimaryColor,
                                      widthM: width * .9,
                                      onTap: _handleInviteCoWorker,
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}

// class ProfileImagePageMain extends StatefulWidget {
//   const ProfileImagePageMain({super.key});

//   @override
//   State<ProfileImagePageMain> createState() => _ProfileImagePageMainState();
// }

// class _ProfileImagePageMainState extends State<ProfileImagePageMain> {
//   final TextEditingController _fullNameController = TextEditingController();
//   final TextEditingController _emailController = TextEditingController();
//   final TextEditingController _passwordController = TextEditingController();
//   final bool _isPasswordVisible = false;

//   @override
//   void dispose() {
//     _fullNameController.dispose();
//     _emailController.dispose();
//     _passwordController.dispose();
//     super.dispose();
//   }

//   @override
//   Widget build(BuildContext context) {
//     double width = MediaQuery.of(context).size.width;
//     double height = MediaQuery.of(context).size.height;
//     return Scaffold(
//       body: SafeArea(
//         child: SizedBox(
//           width: width,
//           height: height,
//           child: Stack(
//             children: [
//               Positioned(
//                 child: Container(
//                   width: width,
//                   height: height * .3,
//                   decoration: const BoxDecoration(
//                     image: DecorationImage(
//                       image: AssetImage('assets/images/banner.png'),
//                       fit: BoxFit.cover,
//                     ),
//                   ),
//                   child: Padding(
//                     padding: const EdgeInsets.all(10.0),
//                     child: Column(
//                       mainAxisAlignment: MainAxisAlignment.end,
//                       crossAxisAlignment: CrossAxisAlignment.end,
//                       children: <Widget>[
//                         Container(
//                           width: 42,
//                           height: 42,
//                           padding: const EdgeInsets.all(8),
//                           // margin: EdgeInsets.all(10),
//                           decoration: BoxDecoration(
//                             borderRadius: BorderRadius.circular(4),
//                             color: Colors.white,
//                           ),
//                           alignment: Alignment.center,
//                           child: IconButton(
//                             icon: const Icon(
//                               CupertinoIcons.camera,
//                               color: AppColors.tBlack,
//                             ),
//                             padding: const EdgeInsets.all(0),
//                             onPressed: () {
//                               // Handle camera icon press here
//                             },
//                           ),
//                         ),
//                       ],
//                     ),
//                   ),
//                 ),
//               ),
//               Positioned(
//                 bottom: 0,
//                 child: SizedBox(
//                   width: width,
//                   height: height * .75,
//                   child: Column(
//                     children: <Widget>[
//                       Row(
//                         children: [
//                            Padding(
//                             padding: const EdgeInsets.symmetric(
//                                 horizontal: 16.0, vertical: 1),
//                             child: AvatarComponent(
//                               image: const AssetImage('assets/images/dp.png'),
//                               width: 80,
//                               height: 80,
//                               borderRadius: BorderRadius.circular(10),
//                             ),
//                           ),
//                           Expanded(
//                             child: Padding(
//                               padding:
//                                    EdgeInsets.only(right: 16.0, top: height * .04),
//                               child: Column(
//                                 mainAxisAlignment: MainAxisAlignment.end,
//                                 crossAxisAlignment: CrossAxisAlignment.start,
//                                 children: [
//                                   Text(
//                                     'John Doe',
//                                     style: TextStyle(
//                                       fontSize: width * .01 + 16,
//                                       fontWeight: FontWeight.w500,
//                                       color: AppColors.tBlack,
//                                       fontFamily: 'WorkSans',
//                                       height: 1,
//                                     ),
//                                   ),
//                                   // SizedBox(height: height * 0.01),
//                                   const Text(
//                                     'Software Engineer',
//                                     style: TextStyle(
//                                       fontWeight: FontWeight.normal,
//                                       fontSize: 10,
//                                     ),
//                                   ),
//                                 ],
//                               ),
//                             ),
//                           ),
//                           Padding(
//                             padding:
//                                 EdgeInsets.only(top: height * .05, right: 10),
//                             child: const MiniOutlinedActionBtn(
//                               text: 'Edit image',
//                               btnColor: AppColors.tPrimaryColor,
//                               textColor: AppColors.tPrimaryColor,
//                             ),
//                           ),
//                         ],
//                       ),
//                       SizedBox(height: height * 0.02),
//                       Expanded(
//                         child: Padding(
//                           padding: const EdgeInsets.symmetric(horizontal: 16.0),
//                           child: SingleChildScrollView(
//                             child: Column(
//                               crossAxisAlignment: CrossAxisAlignment.start,
//                               children: [
//                                 const Text(
//                                   'Full Name',
//                                   style: TextStyle(
//                                     fontWeight: FontWeight.bold,
//                                     fontSize: 16,
//                                   ),
//                                 ),
//                                 SizedBox(height: height * 0.01),
//                                 AuthInputTextFormContainer(
//                                   controller: _fullNameController,
//                                   height: height,
//                                   hintText: 'Enter your full name',
//                                 ),
//                                 SizedBox(height: height * 0.02),
//                                 const Text(
//                                   'Email Address',
//                                   style: TextStyle(
//                                     fontWeight: FontWeight.bold,
//                                     fontSize: 16,
//                                   ),
//                                 ),
//                                 SizedBox(height: height * 0.01),
//                                 AuthInputTextFormContainer(
//                                   controller: _emailController,
//                                   height: height,
//                                   hintText: 'Enter your email address',
//                                 ),
//                                 SizedBox(height: height * 0.02),
//                                 const Text(
//                                   'Password',
//                                   style: TextStyle(
//                                     fontWeight: FontWeight.bold,
//                                     fontSize: 16,
//                                   ),
//                                 ),
//                                 SizedBox(height: height * 0.01),
//                                 ChangePasswordContainer(
//                                   controller: _passwordController,
//                                   height: height,
//                                   hintText: 'Enter current password',
//                                   iconData: _isPasswordVisible
//                                       ? Icons.visibility_outlined
//                                       : Icons.visibility_off_outlined,
//                                   validator: (value) {
//                                     if (value == null || value.isEmpty) {
//                                       return 'Please enter current password';
//                                     }
//                                     return null;
//                                   },
//                                 ),
//                                 SizedBox(height: height * 0.02),
//                                 Row(
//                                   mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                                   children: [
//                                     ActionBtn(
//                                       text: 'Invite co-worker',
//                                       btnColor: AppColors.tPrimaryColor,
//                                       widthM: width * .9,
//                                     )
//                                     // Expanded(
//                                     //   child: ElevatedButton(
//                                     //     onPressed: () {
//                                     //       // Handle invite co-worker press here
//                                     //     },
//                                     //     child: const Text('Invite Co-worker'),
//                                     //   ),
//                                     // ),
//                                   ],
//                                 ),
//                               ],
//                             ),
//                           ),
//                         ),
//                       ),
//                     ],
//                   ),
//                 ),
//               )
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }
