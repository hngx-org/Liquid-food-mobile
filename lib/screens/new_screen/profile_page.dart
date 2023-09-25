import 'package:flutter/material.dart';
import 'package:free_lunch_app/screens/widgets/change_password_container.dart';
import 'package:free_lunch_app/utils/routing/utlils.dart';
import 'package:free_lunch_app/widgets/action_buttons.dart';
import 'package:free_lunch_app/widgets/custom_text_field.dart';

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
  final FocusNode fNameFocus = FocusNode();
  final FocusNode emailFocus = FocusNode();
  final FocusNode passwordFocus = FocusNode();

  @override
  void dispose() {
    _fullNameController.dispose();
    _emailController.dispose();
    _passwordController.dispose();
    fNameFocus.dispose();
    emailFocus.dispose();
    passwordFocus.dispose();
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
                        image: NetworkImage(
                            'https://images.unsplash.com/photo-1634179120307-9f7f2c8c4c4b'),
                        fit: BoxFit.cover,
                      ),
                    ),
                    child: Stack(
                      children: [
                        Positioned(
                          top: height * 0.1,
                          right: width * 0.05,
                          child: Container(
                            width: width * 0.1,
                            height: height * 0.05,
                            padding: const EdgeInsets.all(8),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(4),
                              color: Colors.white.withOpacity(0.8),
                            ),
                            child: IconButton(
                              icon: const Icon(Icons.camera_alt),
                              onPressed: () {
                                // Handle camera icon press here
                              },
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              SizedBox(height: height * 0.02),
              Row(
                children: [
                  const Padding(
                    padding: EdgeInsets.all(16.0),
                    child: CircleAvatar(
                      radius: 50,
                      backgroundImage: NetworkImage(
                          'https://images.unsplash.com/photo-1634179120307-9f7f2c8c4c4b'),
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
                    CustomTextField(
                        textController: _fullNameController,
                        textFocus: fNameFocus,
                        isPassword: false,
                        leadingIcon: const Icon(Icons.person_2_outlined),
                        hintText: 'Enter your full name',
                        validator: (v) {
                          return;
                        },
                        isMultiLine: false,
                        onSubmitted: (v) {
                          Utils.fieldFocusChange(
                              context, fNameFocus, emailFocus);
                        }),
                    SizedBox(height: height * 0.02),
                    const Text(
                      'Email Address',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 16,
                      ),
                    ),
                    SizedBox(height: height * 0.01),
                    CustomTextField(
                        textController: _emailController,
                        textFocus: emailFocus,
                        isPassword: false,
                        leadingIcon: const Icon(Icons.email_outlined),
                        hintText: 'Enter your Email',
                        validator: (v) {
                          return;
                        },
                        isMultiLine: false,
                        onSubmitted: (v) {
                          Utils.fieldFocusChange(
                              context, emailFocus, passwordFocus);
                        }),
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
                      focus: passwordFocus,
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
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Padding(
                          padding: const EdgeInsets.symmetric(vertical: 10.0),
                          child:
                              ActionBtn(text: 'Invite Co-worker', onTap: () {}),
                        )
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
