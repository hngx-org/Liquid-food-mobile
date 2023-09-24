import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:free_lunch_app/features/login/model/login.model.dart';
import 'package:free_lunch_app/features/login/viewmodels/login.viewmodel.dart';
import 'package:free_lunch_app/features/login/viewmodels/user.viewmodel.dart';
import 'package:free_lunch_app/utils/res/colors.dart';
import 'package:free_lunch_app/utils/routing/utlils.dart';
import 'package:free_lunch_app/widgets/custom_text_field.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';
import 'package:provider/provider.dart';

class AuthLoginScreen extends StatefulWidget {
  const AuthLoginScreen({
    super.key,
  });

  @override
  State<AuthLoginScreen> createState() => _AuthLoginScreenState();
}

class _AuthLoginScreenState extends State<AuthLoginScreen> {
  late TextEditingController _emailController;
  late TextEditingController _passwordController;
  late FocusNode passwordFocus;
  late FocusNode emailFocus;
  String? password;

  @override
  void initState() {
    super.initState();
    _emailController = TextEditingController();
    _passwordController = TextEditingController();
    passwordFocus = FocusNode();
    emailFocus = FocusNode();
  }

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
    final userPrefs = Provider.of<UserViewModel>(context);

    return Scaffold(
      body: SafeArea(
          child: ModalProgressHUD(
        inAsyncCall: Provider.of<LoginViewModel>(context).isLoading,
        color: AppColors.primaryColor,
        opacity: 0.2,
        progressIndicator: const CircularProgressIndicator(
          color: AppColors.primaryColor,
        ),
        child: SingleChildScrollView(
          child: Padding(
            padding:
                const EdgeInsets.only(top: 10, left: 20, right: 20, bottom: 10),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Align(
                  alignment: Alignment.center,
                  child: SizedBox(
                    height: height * .3,
                    width: width * .5,
                    child: Stack(
                      alignment: Alignment.topCenter,
                      fit: StackFit.passthrough,
                      children: [
                        Image.asset(
                          'assets/images/burger.png',
                          width: width * .5,
                        ),
                        Positioned(
                            left: 0,
                            bottom: 0,
                            child: Image.asset('assets/images/emojione.png')),
                        Positioned(
                            top: -5,
                            right: -5,
                            child: Image.asset('assets/images/emojitwo.png')),
                      ],
                    ),
                  ),
                ),
                SizedBox(
                  height: height * 0.020,
                ),
                const Text(
                  'Login',
                  style: TextStyle(
                    fontSize: 45,
                    fontWeight: FontWeight.w700,
                    color: Color(0xFF0085FF),
                  ),
                ),
                SizedBox(
                  height: height * 0.016,
                ),
                const Text(
                  'Email address',
                  style: TextStyle(
                    fontWeight: FontWeight.w500,
                    fontSize: 12,
                  ),
                ),
                SizedBox(
                  height: height * 0.008,
                ),
                CustomTextField(
                    textController: _emailController,
                    textFocus: emailFocus,
                    isPassword: false,
                    leadingIcon: const Icon(Icons.email_outlined),
                    hintText: 'Email',
                    validator: (value) {
                      return;
                    },
                    isMultiLine: false,
                    onSubmitted: (value) {
                      Utils.fieldFocusChange(
                          context, emailFocus, passwordFocus);
                    }),
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
                CustomTextField(
                    textController: _passwordController,
                    textFocus: passwordFocus,
                    isPassword: true,
                    leadingIcon: const Icon(Icons.lock),
                    hintText: 'Password',
                    validator: (value) {
                      return;
                    },
                    isMultiLine: false,
                    onSubmitted: (value) {
                      password = value.toString();
                      passwordFocus.unfocus();
                    }),
                SizedBox(
                  height: height * 0.058,
                ),
                GestureDetector(
                  onTap: () async {
                    final userLogin =
                        Provider.of<LoginViewModel>(context, listen: false);
                    if (kDebugMode) {
                      print(_passwordController.text.toLowerCase());
                    }
                    final user = LoginModel(
                      email: _emailController.text.trim().toString(),
                      password: _passwordController.text.trim().toString(),
                    );
                    if (!context.mounted) {}
                    if (!userLogin.isLoading) {
                      await userLogin.login(context, user);
                    }
                    if (userPrefs.accessToken != null) {
                      if (kDebugMode) {
                        print(userPrefs.accessToken);
                      }
                    }
                  },
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
                      'Login',
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
                SizedBox(
                  height: height * 0.040,
                ),
              ],
            ),
          ),
        ),
      )),
    );
  }
}
