// lib/sign_up_model.dart

import 'package:flutter/material.dart';
import 'package:free_lunch_app/utils/colors.dart';
import 'package:free_lunch_app/utils/typography.dart';

class InvitedScreen extends StatefulWidget {
  const InvitedScreen({super.key});

  @override
  State<InvitedScreen> createState() => _InvitedScreenState();
}

class _InvitedScreenState extends State<InvitedScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const SizedBox(height: 30),
            const CircleAvatar(
              radius: 30.0,
              backgroundImage: AssetImage(
                  'assets/images/Company dp.jpg'), // Replace with your image path
            ),
            const SizedBox(height: 16.0),
            Text(
              'Samuel invites you to join HNGx', // Replace with the user's name
              style: AppTypography.headline4,
            ),
            const SizedBox(height: 16.0),
            const Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                CircleAvatar(
                  backgroundColor: AppColors.tShadeColor,
                  child: Icon(
                    Icons.camera,
                    size: 30.0,
                    color: AppColors.tBlack4,
                  ),
                ),
                SizedBox(width: 8.0),
                Text(
                  'Upload Image',
                  style: TextStyle(fontSize: 18.0, color: Colors.blue),
                ),
              ],
            ),
            const SizedBox(height: 16.0),
            Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  children: [
                    TextFormField(
                      decoration: const InputDecoration(
                        border: OutlineInputBorder(),
                        labelText: 'Full Name',
                        prefixIcon: Icon(Icons.person),
                      ),
                    ),
                    const SizedBox(height: 16.0),
                    TextFormField(
                      decoration: const InputDecoration(
                        border: OutlineInputBorder(),
                        labelText: 'Password',
                      ),
                      obscureText: true,
                    ),
                    const SizedBox(height: 16.0),
                    TextFormField(
                      decoration: const InputDecoration(
                        border: OutlineInputBorder(),
                        labelText: 'Confirm Password',
                      ),
                      obscureText: true,
                    ),
                  ],
                )),
                 const SizedBox(height: 16.0),
                ElevatedButton(
                  onPressed: () {
                   
                  },
                  child: const Text('Create Account'),
                  )
          ],
        ),
      ),
    );
  }
}
