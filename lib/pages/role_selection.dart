import 'package:flutter/material.dart';

class RoleSelectionPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Color(0xFFFF6F00),
        title: Text(
          "Choose Role",
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
                  'assets/images/logo.jpg',
                  height: 200,
                ),
                SizedBox(height: 20),
                Text(
                  "Select Your Preferred Role",
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
                    icon: Icons.handyman,
                    text: "I am Worker",
                    color: Color(0xFFE0F7FA),
                    routeName: '/auth',
                  ),
                  SizedBox(height: 20),
                  _buildLanguageTile(
                    context,
                    icon: Icons.business_center,
                    text: "I am Hirer",
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


