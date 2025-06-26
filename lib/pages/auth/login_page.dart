import 'package:flutter/material.dart';

class LoginPage extends StatelessWidget {
  final emailController = TextEditingController();
  final passwordController = TextEditingController();

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
            Container(
              height: 150,width: 500,color:  Color(0xFFFF6F00) ,
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
                  bottomLeft: Radius.circular(50),
                  bottomRight: Radius.circular(50),
                ),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SizedBox(height: 60),
                  Text(
                    "Login to Shram Setu",
                    style: TextStyle(
                      fontSize: 30,
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      letterSpacing: 1.2,
                    ),
                  ),
                  SizedBox(height: 10),
                  Text(
                    "Let's build your future today",
                    style: TextStyle(
                      fontSize: 20,
                      color: Colors.white70,
                    ),
                  )
                ],
              ),
            ),
            SizedBox(height: 40),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24.0),
              child: Column(
                children: [
                  TextField(
                    controller: emailController,
                    decoration: InputDecoration(
                      labelText: 'Email',
                      prefixIcon: Icon(Icons.email, color: Colors.indigo),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                      filled: true,
                      fillColor: Colors.white,
                    ),
                    keyboardType: TextInputType.emailAddress,
                  ),
                  SizedBox(height: 16),
                  TextField(
                    controller: passwordController,
                    obscureText: true,
                    obscuringCharacter: "*",
                    decoration: InputDecoration(
                      labelText: 'Password',
                      prefixIcon: Icon(Icons.lock, color: Colors.red),
                      suffixIcon: Icon(Icons.remove_red_eye),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                      filled: true,
                      fillColor: Colors.white,
                    ),
                  ),
                  SizedBox(height: 30),
                  SizedBox(
                    width: double.infinity,
                    child: ElevatedButton(
                      onPressed: () {
                        Navigator.pushNamed(context, '/success'); // ✅ Route to success
                      },
                      child: Text("Login"),
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.deepOrange,
                        padding: EdgeInsets.symmetric(vertical: 18),
                        textStyle:
                        TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(30),
                        ),
                        elevation: 8,
                        shadowColor: Colors.orangeAccent,
                      ),
                    ),
                  ),
                  SizedBox(height: 12),
                  TextButton(
                    onPressed: () {
                      Navigator.pushNamed(context, '/reset');
                    },
                    child: Text(
                      "Forgot Password?",
                      style: TextStyle(color: Colors.blueGrey, fontSize: 16),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

// import 'package:flutter/material.dart';
//
// class LoginPage extends StatelessWidget {
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
//           "Login",
//           style: TextStyle(
//             fontWeight: FontWeight.bold,
//             color: Colors.white,
//             fontSize: 22,
//           ),
//         ),
//         centerTitle: true,
//       ),
//       body: Center(
//         child: Padding(
//           padding: const EdgeInsets.all(24.0),
//           child: ListView(
//             children: [
//               TextField(
//                 controller: emailController,
//                 decoration: InputDecoration(
//                   labelText: 'Email',
//                   prefixIcon: Icon(Icons.email, color: Colors.indigo),
//                   border: OutlineInputBorder(
//                     borderRadius: BorderRadius.circular(12),
//                   ),
//                   filled: true,
//                   fillColor: Colors.white,
//                 ),
//                 keyboardType: TextInputType.emailAddress,
//               ),
//               SizedBox(height: 16),
//               TextField(
//                 controller: passwordController,
//                 obscureText: true,
//                 obscuringCharacter: "*",
//                 decoration: InputDecoration(
//                   labelText: 'Password',
//                   prefixIcon: Icon(Icons.lock, color: Colors.red),
//                   suffixIcon: Icon(Icons.remove_red_eye),
//                   border: OutlineInputBorder(
//                     borderRadius: BorderRadius.circular(12),
//                   ),
//                   filled: true,
//                   fillColor: Colors.white,
//                 ),
//               ),
//               SizedBox(height: 24),
//               ElevatedButton(
//                 onPressed: () {},
//                 child: Text("Login"),
//                 style: ElevatedButton.styleFrom(
//                   backgroundColor: Colors.deepOrange,
//                   padding: EdgeInsets.symmetric(vertical: 16),
//                   textStyle: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
//                   shape: RoundedRectangleBorder(
//                     borderRadius: BorderRadius.circular(12),
//                   ),
//                 ),
//               ),
//               SizedBox(height: 12),
//               TextButton(
//                 onPressed: () {
//                   Navigator.pushNamed(context, '/reset');
//                 },
//                 child: Text(
//                   "Forgot Password?",
//                   style: TextStyle(color: Colors.blueGrey),
//                 ),
//               ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }