import 'package:flutter/material.dart';

class AuthPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.orange.shade50,
      appBar: AppBar(
        elevation: 0,
        backgroundColor:  Color(0xFFFF6F00),
      ),
      body: Column(
        children: [
          Container(
            height: 200,width: 500,color: Color(0xFFFF6F00),
            child: Image.asset(
              'assets/images/logo.jpg',
              height: 100,
            ),
          ),
          Container(
            width: double.infinity,
            height: 100,
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

// import 'package:flutter/material.dart';
//
// class AuthPage extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: Colors.blueGrey[900],
//       appBar: AppBar(
//         backgroundColor: Colors.pink,
//         title: Text(
//           "Account Options",
//           style: TextStyle(
//             fontWeight: FontWeight.bold,
//             fontSize: 22,
//             color: Colors.white,
//           ),
//         ),
//         centerTitle: true,
//       ),
//       body: Padding(
//         padding: const EdgeInsets.all(24.0),
//         child: Column(
//           mainAxisAlignment: MainAxisAlignment.center,
//           children: [
//             ElevatedButton.icon(
//               icon: Icon(Icons.login, color: Colors.white),
//               label: Text("Login"),
//               style: ElevatedButton.styleFrom(
//                 backgroundColor: Colors.deepOrange,
//                 padding: EdgeInsets.symmetric(vertical: 14, horizontal: 36),
//                 textStyle: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
//                 shape: RoundedRectangleBorder(
//                   borderRadius: BorderRadius.circular(12),
//                 ),
//               ),
//               onPressed: () {
//                 Navigator.pushNamed(context, '/login');
//               },
//             ),
//             SizedBox(height: 20),
//             ElevatedButton.icon(
//               icon: Icon(Icons.person_add, color: Colors.white),
//               label: Text("Create New Account"),
//               style: ElevatedButton.styleFrom(
//                 backgroundColor: Colors.teal,
//                 padding: EdgeInsets.symmetric(vertical: 14, horizontal: 36),
//                 textStyle: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
//                 shape: RoundedRectangleBorder(
//                   borderRadius: BorderRadius.circular(12),
//                 ),
//               ),
//               onPressed: () {
//                 Navigator.pushNamed(context, '/create');
//               },
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }
