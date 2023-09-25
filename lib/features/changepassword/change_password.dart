import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:free_lunch_app/features/login/viewmodels/login.viewmodel.dart';
import 'package:free_lunch_app/features/login/viewmodels/user.viewmodel.dart';
import 'package:free_lunch_app/utils/appurls.dart';
import 'package:free_lunch_app/utils/res/icons.dart';
import 'package:free_lunch_app/utils/routing/utlils.dart';
import 'package:free_lunch_app/utils/utils/typography.dart';
import 'package:free_lunch_app/widgets/action_buttons.dart';
import 'package:free_lunch_app/widgets/custom_text_field.dart';
import 'package:provider/provider.dart';
import 'package:http/http.dart' as http;

class ChangePassword extends StatefulWidget {
  const ChangePassword({super.key});

  @override
  State<ChangePassword> createState() => _ChangePasswordState();
}

class _ChangePasswordState extends State<ChangePassword> {
  final oldFocus = FocusNode();
  final newFocus = FocusNode();
  final newRFocus = FocusNode();

  final oldPassController = TextEditingController();
  final newPassController = TextEditingController();
  final newRPassController = TextEditingController();

  @override
  void dispose() {
    oldFocus.dispose();
    newFocus.dispose();
    newRFocus.dispose();
    oldPassController.dispose();
    newPassController.dispose();
    newRPassController.dispose();
    super.dispose();
  }

  void _changePasswordCall() async {
    final load = Provider.of<LoginViewModel>(context, listen: false);
    load.setLoading(true);
    final String oldPassword = oldPassController.text.toString();
    final String newPassword = newRPassController.text.toString();
    // Replace with your API endpoint
    final String apiUrl = AppUrl.changePassword;
    final String accessToken =
        context.read<UserViewModel>().accessToken.toString();
    print(apiUrl + accessToken);

    Map<String, String> header = {
      "Content-Type": "application/json",
      "Authorization": "Bearer $accessToken"
    };
    Map<String, String> body = {
      'oldPassword': oldPassword,
      'newPassword': newPassword
    };
    final response = await http.patch(Uri.parse(apiUrl),
        body: jsonEncode(body), headers: header);

    print(jsonDecode(response.body));
    if (response.statusCode == 200) {
      if (!context.mounted) {
        return;
      }
      load.setLoading(true);
      Utils.mainAppNav.currentState?.pop();

      Utils.snackBarMessage('Password changed successfully!', context);
    } else {
      if (!context.mounted) {
        return;
      }
      load.setLoading(true);

      'Failed to send invitation.';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
            onPressed: () {
              Utils.mainAppNav.currentState?.pop();
            },
            icon: const Icon(AppIcons.arrowLeft)),
        centerTitle: true,
        title: Text(
          'Change Password',
          style: AppTypography.subHeader,
        ),
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              CustomTextField(
                  textController: oldPassController,
                  textFocus: oldFocus,
                  isPassword: true,
                  leadingIcon: const Icon(null),
                  hintText: 'Enter old password',
                  validator: (v) {
                    return;
                  },
                  isMultiLine: false,
                  onSubmitted: (v) {
                    Utils.fieldFocusChange(context, oldFocus, newFocus);
                  }),
              SizedBox(
                height: MediaQuery.sizeOf(context).height * .02,
              ),
              CustomTextField(
                  textController: newPassController,
                  textFocus: newFocus,
                  isPassword: true,
                  leadingIcon: const Icon(null),
                  hintText: 'Enter new password',
                  validator: (v) {
                    return;
                  },
                  isMultiLine: false,
                  onSubmitted: (v) {
                    Utils.fieldFocusChange(context, newFocus, newRFocus);
                  }),
              SizedBox(
                height: MediaQuery.sizeOf(context).height * .02,
              ),
              CustomTextField(
                  textController: newRPassController,
                  textFocus: newRFocus,
                  isPassword: true,
                  leadingIcon: const Icon(null),
                  hintText: 'Enter new password again',
                  validator: (v) {
                    return;
                  },
                  isMultiLine: false,
                  onSubmitted: (v) {}),
              SizedBox(
                height: MediaQuery.sizeOf(context).height * .04,
              ),
              ActionBtn(
                  text: 'Change Password',
                  onTap: () {
                    _changePasswordCall();
                  })
            ],
          ),
        ),
      ),
    );
  }
}
