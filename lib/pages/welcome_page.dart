// THIS IS THE WELCOME PAGE --> WILL BE SHOWN WHEN SOMEONE OPEN THE APP
// To go forward user have to click on "GET STARTED" button

import 'package:flutter/material.dart';

class WelcomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFF5F5F5),
      body: Column(
        children: [
          Container(
            width: double.infinity,
            height: 320,
            decoration: BoxDecoration(
              color: Color(0xFFFF6F00),
              borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(50),
                bottomRight: Radius.circular(50),
              ),
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(height: 40),
                Image.asset('assets/images/logo.jpg', height: 150), // our app logo
                SizedBox(height: 20),
                Text(
                  "Welcome to",
                  style: TextStyle(
                    fontSize: 24,
                    color: Colors.white,
                  ),
                ),
                Text(
                  "SHRAM SETU", // App NAME
                  style: TextStyle(
                    fontSize: 32,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                    letterSpacing: 2,
                  ),
                ),
              ],
            ),
          ),
          SizedBox(height: 50),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24.0),
            child: Container(
              margin: EdgeInsets.only(top: 20),
              child: Column(
                // QUOTE IN HINDI AND ENGLISH WHICH DESCRIBE OUR APP IN SHORT
                children: [
                  Text(
                      "🔨 हर हाथ को काम मिले,🎯 हर हुनर को सम्मान मिले — 🛠️🤝 श्रमसेतु वह पुल है जहाँ 🌟 गरिमा और 🧑‍💼 अवसर मिलते हैं।",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 24,
                      fontStyle: FontStyle.italic,
                      fontWeight: FontWeight.bold,
                      color: Colors.brown.shade700,
                    ),
                  ),
                  SizedBox(height: 20,),
                  Text(
                    "🔨 Every hand deserves work,🎯 Every skill deserves respect —🛠️🤝 ShramSetu is the bridge where🌟 dignity meets opportunity.",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 24,
                      fontStyle: FontStyle.italic,
                      fontWeight: FontWeight.bold,
                      color: Colors.brown.shade700,
                    ),
                  ),
                ],
              ),
            ),
          ),
          Spacer(),

          // This is the button "Get Started" -> on clickin it , user will redirect to the next page
          Padding(
            padding: const EdgeInsets.all(24.0),
            child: SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () => Navigator.pushNamed(context, '/language'), // connecting the next page(language selection page)
                style: ElevatedButton.styleFrom(
                  backgroundColor: Color(0xFF4CAF50),
                  padding: EdgeInsets.symmetric(vertical: 16),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30),
                  ),
                ),
                child: Text(
                  'GET STARTED',
                  style: TextStyle(color: Color(0xFFF5F5F5),fontSize: 20, fontWeight: FontWeight.bold),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}

