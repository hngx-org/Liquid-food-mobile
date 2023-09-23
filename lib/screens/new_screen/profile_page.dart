// ignore_for_file: library_private_types_in_public_api

import 'package:flutter/material.dart';
import 'package:iconly/iconly.dart';

import '../../feature/utils/colors.dart';
import '../../widgets/avatar.dart';
import '../../withdrawal/presentation/widgets/screen_styles.dart';
import '../../withdrawal/presentation/widgets/w_button.dart';
import '../widgets/auth_input_password_container.dart';
import '../widgets/auth_input_textform_container.dart';
import '../../widgets/action_buttons.dart';
import 'package:free_lunch_app/screens/screens.dart';

class ProfileImagePage extends StatefulWidget {
  const ProfileImagePage({Key? key}) : super(key: key);

  @override
  _ProfileImagePageState createState() => _ProfileImagePageState();
}

class _ProfileImagePageState extends State<ProfileImagePage> {
  final TextEditingController _fullNameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

   void _handleInviteCoWorker() {
     Navigator.pushNamed(context, '/');
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
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;

    return Scaffold(
      backgroundColor: AppColors.backgroundColor,
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Stack(
            clipBehavior: Clip.none,
            children: [
              SizedBox(
                width: double.infinity,
                height: height * 0.25,
                child: Image.asset(
                  'assets/images/hngx.png',
                  fit: BoxFit.fill,
                ),
              ),
              Positioned(
                top: height * 0.17,
                right: width * 0.06,
                child: GestureDetector(
                  onTap: () {},
                  child: Container(
                    width: width * 0.13,
                    height: height * 0.05,
                    padding: const EdgeInsets.all(10),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(4),
                      color: Colors.white,
                    ),
                    child: const Icon(IconlyLight.camera),
                  ),
                ),
              ),
              Positioned(
                top: height * 0.229,
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: width * 0.034),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          Center(
                            child: AvatarComponent(
                                image: const AssetImage('assets/images/dp.png'),
                                width: width * .22,
                                height: height * .11),
                          ),
                          SizedBox(width: width * 0.03),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const WText(
                                text: 'Samuel Iboji',
                                fontWeight: FontWeight.w400,
                                fontSize: 16,
                                height: 1.5,
                              ),
                              Row(
                                children: [
                                  const Icon(
                                    Icons.verified,
                                    size: 15,
                                    color: AppColors.tAmberAccent,
                                  ),
                                  SizedBox(width: width * 0.01),
                                  const WText(
                                    text: 'HNG Admin',
                                    fontWeight: FontWeight.w400,
                                    fontSize: 10,
                                    color: AppColors.tBlack5,
                                  ),
                                ],
                              ),
                            ],
                          ),
                          SizedBox(width: width * 0.16),
                          Container(
                            padding: const EdgeInsets.all(8),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(8),
                              border: Border.all(
                                color: AppColors.primaryColor,
                              ),
                            ),
                            child: const WText(
                              text: 'Edit image',
                              fontSize: 12,
                              fontWeight: FontWeight.w500,
                              color: AppColors.primaryColor,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(height: height * 0.38),
            ],
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: width * 0.034),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const WText(
                  text: 'Full name',
                  fontWeight: FontWeight.w500,
                  fontSize: 12,
                  color: AppColors.tShadeColor,
                ),
                SizedBox(height: height * 0.008),
                AuthInputTextFormContainer(
                  controller: _fullNameController,
                  height: height,
                  hintText: 'Samuel Iboji',
                ),
                SizedBox(height: height * 0.02),
                const WText(
                  text: 'Email address',
                  fontWeight: FontWeight.w500,
                  fontSize: 12,
                  color: AppColors.tShadeColor,
                ),
                SizedBox(height: height * 0.008),
                AuthInputTextFormContainer(
                  controller: _emailController,
                  height: height,
                  hintText: 'Uche.samuel21@gmail.com',
                ),
                SizedBox(height: height * 0.02),
                const WText(
                  text: 'Password',
                  fontWeight: FontWeight.w500,
                  fontSize: 12,
                  color: AppColors.tShadeColor,
                ),
                SizedBox(height: height * 0.008),
                AuthInputPasswordContainer(
                  height: height,
                  hintText: '**************',
                  controller: _passwordController,
                  suffixIcon: Padding(
                    padding: const EdgeInsets.all(13),
                    child: GestureDetector(
                      onTap: () {},
                      child: WTextButton(
                        onTap: () {
                          Navigator.pushNamed(context, '/change-password');
                        },
                        text: 'Change password',
                        color: AppColors.primaryColor,
                        fontSize: 12,
                      ),
                    ),
                  ),
                ),
                SizedBox(height: height * 0.09),
                 ActionBtn3(
                  text: 'Invite co-worker',
                  btnColor: AppColors.tPrimaryColor,
                  widthM: width * .9,
                  onTap: _handleInviteCoWorker,
                ),
                // const WButton(
                //   title: 'Invite co-worker',
                //   color: AppColors.backgroundColor,
                // )
              ],
            ),
          ),
        ],
      ),
    );
  }
}