import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:free_lunch_app/features/login/viewmodels/login.viewmodel.dart';
import 'package:free_lunch_app/features/login/viewmodels/user.viewmodel.dart';
import 'package:free_lunch_app/utils/appurls.dart';
import 'package:free_lunch_app/utils/res/icons.dart';
import 'package:free_lunch_app/utils/res/typography.dart';
import 'package:free_lunch_app/utils/routing/utlils.dart';
import 'package:free_lunch_app/widgets/action_buttons.dart';
import 'package:free_lunch_app/widgets/custom_text_field.dart';

import 'package:http/http.dart' as http;
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';
import 'package:provider/provider.dart';

class InviteDialog extends StatefulWidget {
  const InviteDialog({super.key});

  @override
  InviteDialogState createState() => InviteDialogState();
}

class InviteDialogState extends State<InviteDialog> {
  final TextEditingController _emailController = TextEditingController();

  @override
  void dispose() {
    _emailController.dispose();
    super.dispose();
  }

  void _inviteCoWorker() async {
    final load = Provider.of<LoginViewModel>(context, listen: false);
    load.setLoading(true);
    final String email = _emailController.text;
    // Replace with your API endpoint
    final String apiUrl = AppUrl.orgInvite;
    final String accessToken =
        context.read<UserViewModel>().accessToken.toString();
    print(apiUrl + accessToken + email);

    Map<String, String> header = {
      "Content-Type": "application/json",
      "Authorization": "Bearer $accessToken"
    };
    final response = await http.post(Uri.parse(apiUrl),
        body: jsonEncode({'email': email}), headers: header);

    print(jsonDecode(response.body));
    if (response.statusCode == 200) {
      if (!context.mounted) {
        return;
      }
      load.setLoading(true);
      Utils.mainAppNav.currentState?.pop();

      Utils.snackBarMessage('Invitation sent successfully!', context);
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
    return ModalProgressHUD(
      inAsyncCall: !context.read<LoginViewModel>().isLoading,
      child: AlertDialog(
        title: Text(
          'Invite Co-Worker',
          style: AppTypography.subHeader1black,
        ),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            CustomTextField(
                textController: _emailController,
                textFocus: FocusNode(),
                isPassword: false,
                leadingIcon: const Icon(null),
                hintText: 'Enter co-worker\'s email',
                validator: (v) {
                  return null;
                },
                isMultiLine: false,
                onSubmitted: (x) {}),
            const SizedBox(
              height: 30,
            ),
          ],
        ),
        actions: <Widget>[
          SizedBox(
              height: 50,
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 40.0),
                child: ActionBtn(
                    text: 'Invite Co-worker',
                    onTap: () {
                      _inviteCoWorker();
                    }),
              ))
        ],
      ),
    );
  }
}
