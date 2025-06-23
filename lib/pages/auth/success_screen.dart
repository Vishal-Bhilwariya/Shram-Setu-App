import 'package:flutter/material.dart';

class SuccessScreen extends StatelessWidget {
  final String message;

  SuccessScreen({this.message = "Your action was successful!"});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.orange.shade50,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Center(
            child: Container(
              padding: EdgeInsets.all(30),
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: Colors.greenAccent,
              ),
              child: Icon(
                Icons.check_circle,
                color: Colors.green,
                size: 100,
              ),
            ),
          ),
          SizedBox(height: 30),
          Text(
            "Success!",
            style: TextStyle(
              fontSize: 28,
              fontWeight: FontWeight.bold,
              color: Colors.green.shade700,
            ),
          ),
          SizedBox(height: 16),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 40.0),
            child: Text(
              message,
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 16,
                color: Colors.black87,
              ),
            ),
          ),
          SizedBox(height: 40),
          ElevatedButton(
            onPressed: () {
              Navigator.pop(context);
            },
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.deepOrange,
              padding: EdgeInsets.symmetric(horizontal: 32, vertical: 14),
              textStyle: TextStyle(fontSize: 18),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(30),
              ),
            ),
            child: Text("Go to DASHBOARD",style: TextStyle(color: Colors.white),),
          ),
        ],
      ),
    );
  }
}