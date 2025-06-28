// In this new user can create their account

import 'package:flutter/material.dart';

class CreateAccountPage extends StatelessWidget {
  final TextEditingController fullName = TextEditingController();
  final TextEditingController number = TextEditingController();
  final TextEditingController age = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.orange.shade50,
      appBar: AppBar(
        elevation: 0,
        backgroundColor:  Color(0xFFFF6F00),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            // Top Header
            Container(
              height: 100,width: 500,color:  Color(0xFFFF6F00) ,
              child: Image.asset(
                'assets/images/logo.jpg',
              ),
            ),
            Container(
              width: double.infinity,
              height: 150,
              decoration: BoxDecoration(
                color:  Color(0xFFFF6F00) ,
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(40),
                  bottomRight: Radius.circular(40),
                ),
              ),
              child: Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SizedBox(height: 60),
                    Text(
                      "Create Account",
                      style: TextStyle(
                        fontSize: 28,
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(height: 10),
                    Text(
                      "Join Shram Setu and explore jobs instantly",
                      style: TextStyle(
                        fontSize: 16,
                        color: Colors.white70,
                      ),
                    ),
                  ],
                ),
              ),
            ),

            // Form
            SizedBox(height: 30),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24.0),
              child: Column(
                children: [
                  buildInputField("Full Name", Icons.person, fullName),
                  buildInputField("Mobile Number", Icons.phone, number, inputType: TextInputType.phone),
                  buildInputField("Age", Icons.calendar_today, age, inputType: TextInputType.number),
                  buildInputField("Email", Icons.email, emailController, inputType: TextInputType.emailAddress),
                  buildInputField("Password", Icons.lock, passwordController, isPassword: true),
                  SizedBox(height: 25),
                  SizedBox(
                    width: double.infinity,
                    child: ElevatedButton(
                      onPressed: () {
                        Navigator.pushNamed(context, '/success'); // ✅ Route to success
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.teal.shade700,
                        padding: EdgeInsets.symmetric(vertical: 16),
                        textStyle: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(30),
                        ),
                        elevation: 5,
                      ),
                      child: Text("Create Account",style: TextStyle(color:Colors.white ),),
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }

  // Input field builder
  Widget buildInputField(
      String label,
      IconData icon,
      TextEditingController controller, {
        bool isPassword = false,
        TextInputType inputType = TextInputType.text,
      }) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 16.0),
      child: TextField(
        controller: controller,
        obscureText: isPassword,
        obscuringCharacter: '*',
        keyboardType: inputType,
        decoration: InputDecoration(
          labelText: label,
          prefixIcon: Icon(icon, color: Colors.teal),
          filled: true,
          fillColor: Colors.white,
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(12),
          ),
        ),
      ),
    );
  }
}


//
// import 'package:flutter/material.dart';
//
// class CreateAccountPage extends StatelessWidget {
//   final fullName = TextEditingController();
//   final number = TextEditingController();
//   final age = TextEditingController();
//   final emailController = TextEditingController();
//   final passwordController = TextEditingController();
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: Colors.blueGrey[900],
//       appBar: AppBar(
//         backgroundColor: Colors.pink,
//         title: Text(
//           "Create Account",
//           style: TextStyle(
//             fontWeight: FontWeight.bold,
//             color: Colors.white,
//             fontSize: 22,
//           ),
//         ),
//         centerTitle: true,
//       ),
//       body: Padding(
//         padding: const EdgeInsets.all(24.0),
//         child: ListView(
//           children: [
//             TextField(
//               controller: fullName,
//               decoration: InputDecoration(
//                 labelText: 'Full Name',
//                 prefixIcon: Icon(Icons.person, color: Colors.deepOrange),
//                 border: OutlineInputBorder(
//                   borderRadius: BorderRadius.circular(12),
//                 ),
//                 filled: true,
//                 fillColor: Colors.white,
//               ),
//             ),
//             SizedBox(height: 16),
//             TextField(
//               controller: number,
//               keyboardType: TextInputType.number,
//               decoration: InputDecoration(
//                 labelText: 'Mobile Number',
//                 prefixIcon: Icon(Icons.phone, color: Colors.teal),
//                 border: OutlineInputBorder(
//                   borderRadius: BorderRadius.circular(12),
//                 ),
//                 filled: true,
//                 fillColor: Colors.white,
//               ),
//             ),
//             SizedBox(height: 16),
//             TextField(
//               controller: age,
//               keyboardType: TextInputType.number,
//               decoration: InputDecoration(
//                 labelText: 'Age',
//                 prefixIcon: Icon(Icons.cake, color: Colors.purple),
//                 border: OutlineInputBorder(
//                   borderRadius: BorderRadius.circular(12),
//                 ),
//                 filled: true,
//                 fillColor: Colors.white,
//               ),
//             ),
//             SizedBox(height: 16),
//             TextField(
//               controller: emailController,
//               keyboardType: TextInputType.emailAddress,
//               decoration: InputDecoration(
//                 labelText: 'Email',
//                 prefixIcon: Icon(Icons.email, color: Colors.indigo),
//                 border: OutlineInputBorder(
//                   borderRadius: BorderRadius.circular(12),
//                 ),
//                 filled: true,
//                 fillColor: Colors.white,
//               ),
//             ),
//             SizedBox(height: 16),
//             TextField(
//               controller: passwordController,
//               obscureText: true,
//               obscuringCharacter: "*",
//               decoration: InputDecoration(
//                 labelText: 'Password',
//                 prefixIcon: Icon(Icons.lock, color: Colors.red),
//                 suffixIcon: Icon(Icons.remove_red_eye),
//                 border: OutlineInputBorder(
//                   borderRadius: BorderRadius.circular(12),
//                 ),
//                 filled: true,
//                 fillColor: Colors.white,
//               ),
//             ),
//             SizedBox(height: 24),
//             ElevatedButton(
//               onPressed: () {},
//               child: Text("Create"),
//               style: ElevatedButton.styleFrom(
//                 backgroundColor: Colors.deepOrange,
//                 padding: EdgeInsets.symmetric(vertical: 16),
//                 textStyle: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
//                 shape: RoundedRectangleBorder(
//                   borderRadius: BorderRadius.circular(12),
//                 ),
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }