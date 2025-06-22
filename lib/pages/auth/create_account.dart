import 'package:flutter/material.dart';

class CreateAccountPage extends StatelessWidget {
  final fullName = TextEditingController();
  final number = TextEditingController();
  final age = TextEditingController();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Create Account",style: TextStyle(fontWeight: FontWeight.bold),)),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          children: [
            TextField(
                controller: fullName,
                decoration: InputDecoration(
                    labelText: 'Full Name',
                    prefixIcon: Icon(Icons.person),
                ),
            ),
            TextField(
                controller: number,
                keyboardType:TextInputType.number,
                decoration: InputDecoration(
                    labelText: 'Mobile Number',
                    prefixIcon: Icon(Icons.phone),
                )
            ),
            TextField(
              controller: age,
              keyboardType:TextInputType.number,
                decoration: InputDecoration(
                    labelText: 'Age',
                  prefixIcon: Icon(Icons.cake),
                ),
            ),
            TextField(
                controller: emailController,
                keyboardType:TextInputType.emailAddress,
                decoration: InputDecoration(
                    labelText: 'Email',
                  prefixIcon: Icon(Icons.email),
                )
            ),

            TextField(
                controller: passwordController,
                obscuringCharacter: "*",
                decoration: InputDecoration(
                    labelText: 'Password',
                  prefixIcon: Icon(Icons.password),
                  suffixIcon: Icon(Icons.remove_red_eye),
                ),
                obscureText: true
            ),
            ElevatedButton(onPressed: () {}, child: Text("Create")),
          ],
        ),
      ),
    );
  }
}
