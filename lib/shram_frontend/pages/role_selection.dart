// This is the page of "Role Selection" from Worker and Hirer
// If you are worker then u should click on "I am Worker" . -> It will redirect you to WORKER DASHBOARD
// If you are hirer then u should click on "I am Hirer" . -> It will redirect you to Hirer DASHBOARD

import 'package:flutter/material.dart';

class RoleSelectionPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor:  Color(0xFFFF6F00),
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
                    routeName: '/worker_dashboard',
                  ),
                  SizedBox(height: 20),
                  _buildLanguageTile(
                    context,
                    icon: Icons.business_center,
                    text: "I am Hirer",
                    color: Color(0xFFE0F7FA),
                    routeName: '/hirer-dashboard',
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

// import 'package:flutter/material.dart';
//
// class RoleSelectionPage extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: Colors.blueGrey[900],
//       appBar: AppBar(
//         backgroundColor: Colors.pink,
//         title: Text(
//           "Select Role",
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
//               icon: Icon(Icons.handyman, color: Colors.white),
//               label: Text("Worker"),
//               style: ElevatedButton.styleFrom(
//                 backgroundColor: Colors.deepOrange,
//                 padding: EdgeInsets.symmetric(vertical: 14, horizontal: 36),
//                 textStyle: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
//                 shape: RoundedRectangleBorder(
//                   borderRadius: BorderRadius.circular(12),
//                 ),
//               ),
//               onPressed: () {
//                 Navigator.pushNamed(context, '/auth');
//               },
//             ),
//             SizedBox(height: 20),
//             ElevatedButton.icon(
//               icon: Icon(Icons.business_center, color: Colors.white),
//               label: Text("Hirer"),
//               style: ElevatedButton.styleFrom(
//                 backgroundColor: Colors.teal,
//                 padding: EdgeInsets.symmetric(vertical: 14, horizontal: 36),
//                 textStyle: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
//                 shape: RoundedRectangleBorder(
//                   borderRadius: BorderRadius.circular(12),
//                 ),
//               ),
//               onPressed: () {
//                 Navigator.pushNamed(context, '/auth');
//               },
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }
//
//
//
// // // role_selection.dart
// // import 'package:flutter/material.dart';
// //
// // class RoleSelectionPage extends StatelessWidget {
// //   @override
// //   Widget build(BuildContext context) {
// //     return Scaffold(
// //       appBar: AppBar(title: Text("Choose Role",style: TextStyle(fontWeight: FontWeight.bold))),
// //       body: Center(
// //         child: Column(
// //           mainAxisAlignment: MainAxisAlignment.center,
// //           children: [
// //             TextButton(
// //               onPressed: () =>  Navigator.pushNamed(context, '/auth'),
// //               child: Text("WORKER",style: TextStyle(fontSize: 30,fontWeight: FontWeight.bold),)
// //             ),
// //             Container(height: 10,),
// //             TextButton(
// //                 onPressed: () =>  Navigator.pushNamed(context, '/auth'),
// //                 child: Text("HIRER",style: TextStyle(fontSize: 30,fontWeight: FontWeight.bold),)
// //             )
// //           ],
// //         ),
// //       ),
// //     );
// //   }
// // }
