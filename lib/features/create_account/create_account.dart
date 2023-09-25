import 'package:flutter/material.dart';
import '../../widgets/auth_input_form.dart';
import '../../widgets/password_input_form.dart';

class CreateAccount extends StatefulWidget {
  const CreateAccount({
    super.key,
  });

  @override
  State<CreateAccount> createState() => _CreateAccountState();
}

class _CreateAccountState extends State<CreateAccount> {
  final TextEditingController _fullNameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _organizationNameController =
      TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _confirmPasswordController =
      TextEditingController();

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
          padding:
              const EdgeInsets.only(top: 10, left: 20, right: 20, bottom: 10),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                'Create an \naccount',
                style: TextStyle(
                  fontSize: 45,
                  fontWeight: FontWeight.w700,
                  color: Color(0xFF0085FF),
                ),
              ),
              SizedBox(
                height: height * 0.020,
              ),
              Row(
                children: [
                  Container(
                    padding: const EdgeInsets.all(15),
                    decoration: const BoxDecoration(
                      shape: BoxShape.circle,
                      color: Color(0xFFD9D9D9),
                    ),
                    child: const Icon(
                      Icons.camera_alt_outlined,
                      color: Colors.grey,
                    ),
                  ),
                  SizedBox(
                    width: width * 0.032,
                  ),
                  Container(
                    padding: const EdgeInsets.all(8),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8),
                      border: Border.all(color: const Color(0xFF0085FF)),
                    ),
                    child: const Text(
                      'Upload image',
                      style: TextStyle(
                        fontSize: 12,
                        fontWeight: FontWeight.w500,
                        color: Color(0xFF0085FF),
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: height * 0.016,
              ),
              const Text(
                'Full name',
                style: TextStyle(fontWeight: FontWeight.w500, fontSize: 12),
              ),
              SizedBox(
                height: height * 0.008,
              ),
              AuthInputTextFormContainer(
                controller: _fullNameController,
                height: height,
                hintText: 'Enter your full name',
              ),
              SizedBox(
                height: height * 0.016,
              ),
              const Text(
                'Organization email',
                style: TextStyle(
                  fontWeight: FontWeight.w500,
                  fontSize: 12,
                ),
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
              const Text(
                'Organization name',
                style: TextStyle(fontWeight: FontWeight.w500, fontSize: 12),
              ),
              SizedBox(
                height: height * 0.008,
              ),
              AuthInputTextFormContainer(
                controller: _organizationNameController,
                height: height,
                hintText: 'Enter your organization name',
              ),
              SizedBox(
                height: height * 0.016,
              ),
              const Text(
                'Password',
                style: TextStyle(fontWeight: FontWeight.w500, fontSize: 12),
              ),
              SizedBox(
                height: height * 0.008,
              ),
              AuthInputPasswordContainer(
                controller: _passwordController,
                height: height,
                hintText: 'Enter your password',
                iconData: Icons.visibility_off_outlined,
              ),
              SizedBox(
                height: height * 0.016,
              ),
              const Text(
                'Confirm Password',
                style: TextStyle(fontWeight: FontWeight.w500, fontSize: 12),
              ),
              SizedBox(
                height: height * 0.008,
              ),
              AuthInputPasswordContainer(
                controller: _confirmPasswordController,
                height: height,
                hintText: 'Enter your confirm password',
                iconData: Icons.visibility_off_outlined,
              ),
              SizedBox(
                height: height * 0.058,
              ),
              GestureDetector(
                onTap: () async {},
                child: Container(
                  alignment: Alignment.center,
                  padding: const EdgeInsets.only(
                    top: 16,
                    left: 24,
                    bottom: 16,
                    right: 24,
                  ),
                  height: height * 0.080,
                  width: double.infinity,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(32),
                      color: const Color(0xFF0085FF)),
                  child: const Text(
                    'Create Account',
                    style: TextStyle(
                        fontWeight: FontWeight.w500,
                        fontSize: 16,
                        color: Colors.white),
                  ),
                ),
              ),
              SizedBox(
                height: height * 0.020,
              ),
              GestureDetector(
                onTap: () {},
                child: const Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'I already have an account',
                      style: TextStyle(
                        fontSize: 12,
                        fontWeight: FontWeight.w500,
                        color: Color(0xFF0085FF),
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: height * 0.040,
              ),
            ],
          ),
        ),
      )),
    );
  }
}
