import 'package:flutter/material.dart';

class ResetPasswordPage extends StatelessWidget {
  final emailController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Reset Password")),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              TextField(controller: emailController, decoration: InputDecoration(labelText: 'Enter your email')),
              ElevatedButton(onPressed: () {}, child: Text("Send Reset Link")),
            ],
          ),
        ),
      ),
    );
  }
}
