// In this page , User have to select their preferred language .
// On clicking on language will redirect user to next page

import 'package:flutter/material.dart';

class LanguageSelectionPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor:  Color(0xFFFF6F00),
      // APP BAR
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Color(0xFFFF6F00),
        title: Text(
          "Choose Language",
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 22,
            color: Colors.white,
          ),
        ),
        centerTitle: true,
      ),
      body: Column(
        children: [
          Container(
            width: double.infinity,
            padding: EdgeInsets.all(20),
            child: Column(
              children: [
                Image.asset(
                  'assets/images/logo.jpg', // app logo
                  height: 200,
                ),
                SizedBox(height: 20),
                Text(
                  "Select Your Preferred Language",
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: Colors.black87,
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child: Container(
              decoration: BoxDecoration(
                color: Color(0xFFFFF3E0),
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(40),
                  topRight: Radius.circular(40),
                ),
              ),
              padding: EdgeInsets.symmetric(horizontal: 32, vertical: 40),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  _buildLanguageTile(
                    context,
                    icon: Icons.language,
                    text: "English",
                    color: Color(0xFFE0F7FA),
                    routeName: '/auth',
                  ),
                  SizedBox(height: 20),
                  _buildLanguageTile(
                    context,
                    icon: Icons.translate,
                    text: "Hindi",
                    color: Color(0xFFE0F7FA),
                    routeName: '/auth',
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  // THIS IS THE FUNCTION TO CREATE different language options.
  Widget _buildLanguageTile(BuildContext context, {
    required IconData icon,
    required String text,
    required Color color,
    required String routeName,
  }) {
    return ElevatedButton.icon(
      icon: Icon(icon, size: 26),
      label: Text(
        text,
        style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
      ),
      onPressed: () => Navigator.pushNamed(context, routeName),
      style: ElevatedButton.styleFrom(
        backgroundColor: color,
        padding: EdgeInsets.symmetric(vertical: 16),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(14),
        ),
      ),
    );
  }
}