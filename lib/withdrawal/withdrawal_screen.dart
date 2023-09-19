import 'package:flutter/material.dart';

class WithdrawalScreen extends StatelessWidget {
  const WithdrawalScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Withdrawal')),
      backgroundColor: Colors.white,
      body: const Center(
        child: Text('Withdraw an Amount'),
      ),
    );
  }
}
