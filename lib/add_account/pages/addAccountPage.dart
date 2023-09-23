import 'package:flutter/material.dart';
import 'package:free_lunch_app/feature/utils/typography.dart';
import '../../screens/widgets/auth_input_textform_container.dart';
import '../../utils/res/colors.dart';
import '../../withdrawal/presentation/widgets/screen_styles.dart';
import '../../withdrawal/presentation/widgets/w_button.dart';

class AddAccountView extends StatefulWidget {
  const AddAccountView({super.key});

  @override
  State<AddAccountView> createState() => _AddAccountViewState();
}

class _AddAccountViewState extends State<AddAccountView> {
  final TextEditingController _fullNameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();

  @override
  void dispose() {
    super.dispose();
    _fullNameController.dispose();
    _emailController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(
        title: Text('Add account'),
        centerTitle: true,
      ),
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: width * 0.04),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: height * 0.016),
              Text(
                'Account number',
                style: AppTypography.subHeader3w500Black,
              ),
              SizedBox(height: height * 0.008),
              AuthInputTextFormContainer(
                controller: _fullNameController,
                height: height,
                hintText: 'Enter your account number',
              ),
              SizedBox(height: height * 0.016),
              Text(
                'Account full name',
                style: AppTypography.subHeader3w500Black,
              ),
              SizedBox(
                height: height * 0.008,
              ),
              AuthInputTextFormContainer(
                controller: _emailController,
                height: height,
                hintText: 'Enter your account name',
              ),
              SizedBox(height: height * 0.016),
              Text(
                'Select bank',
                style: AppTypography.subHeader3w500Black,
              ),
              SizedBox(
                height: height * 0.008,
              ),
              AuthInputTextFormContainer(
                controller: _emailController,
                height: height,
                hintText: 'select your bank',
              ),
              Expanded(child: SizedBox()),
              WButton(
                onTap: () => Navigator.pushReplacementNamed(
                    context, '/withdraw-account'),
                title: 'Save',
                color: AppColors.backgroundColor,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
