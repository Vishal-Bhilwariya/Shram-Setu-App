import 'package:flutter/material.dart';

class AuthPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.orange.shade50,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Color(0xFF00897B),
      ),
      body: Column(
        children: [
          Container(
            height: 200,width: 500,color:Color(0xFF00897B),
            child: Image.asset(
              'assets/images/logo.jpg',
              height: 100,
            ),
          ),
          Container(
            width: double.infinity,
            height: 200,
            decoration: BoxDecoration(
              color:Color(0xFF00897B),
              borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(50),
                bottomRight: Radius.circular(50),
              ),
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  child: Text(
                    "Welcome to Shram Setu",
                    style: TextStyle(
                      fontSize: 26,
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      letterSpacing: 1.2,
                    ),
                  ),
                ),
                SizedBox(height: 10),
                Container(
                  child: Text(
                    "Choose how you'd like to continue",
                    style: TextStyle(
                      fontSize: 18,
                      color: Color(0xFFFFE0B2),
                    ),
                  ),
                )
              ],
            ),
          ),
          SizedBox(height: 60),
          Container(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24.0),
              child: Column(
                children: [
                  ElevatedButton.icon(
                    icon: Icon(Icons.login, color: Color(0xFF4CAF50)),
                    label: Text("Login",style: TextStyle(fontWeight: FontWeight.bold),),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Color(0xFFF5F5F5),
                      padding: EdgeInsets.symmetric(vertical: 16, horizontal: 40),
                      elevation: 6,
                      shadowColor: Color(0xFF4CAF50),
                      textStyle:
                      TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(30),
                      ),
                    ),
                    onPressed: () {
                      Navigator.pushNamed(context, '/login');
                    },
                  ),
                  SizedBox(height: 30),
                  ElevatedButton.icon(
                    icon: Icon(Icons.person_add, color: Color(0xFF4CAF50)),
                    label: Text("Create New Account"),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Color(0xFFF5F5F5),
                      padding: EdgeInsets.symmetric(vertical: 16, horizontal: 30),
                      elevation: 6,
                      shadowColor: Color(0xFF4CAF50),
                      textStyle:
                      TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(30),
                      ),
                    ),
                    onPressed: () {
                      Navigator.pushNamed(context, '/create');
                    },
                  ),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
