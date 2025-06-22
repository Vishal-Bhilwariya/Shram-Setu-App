// welcome_page.dart
import 'package:flutter/material.dart';

class WelcomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blueGrey[900],
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text("Welcome to SHRAM SETU", style: TextStyle(color: Colors.white,fontSize: 25,fontWeight: FontWeight.bold),),
            ElevatedButton(
              style: ElevatedButton.styleFrom(backgroundColor: Colors.deepOrange),
              child: Text('START',style: TextStyle(color: Colors.white,fontSize: 20,fontWeight: FontWeight.bold),),
              onPressed: () => Navigator.pushNamed(context, '/language'),
            ),
          ],
        ),
      ),
    );
  }
}
