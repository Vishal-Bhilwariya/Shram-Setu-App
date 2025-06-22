import 'package:flutter/material.dart';

class AuthPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Account Options",style: TextStyle(fontWeight: FontWeight.bold),),),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(onPressed: () => Navigator.pushNamed(context, '/create'), child: Text("Create Account")),
            ElevatedButton(onPressed: () => Navigator.pushNamed(context, '/login'), child: Text("Login")),
          ],
        ),
      ),
    );
  }
}
