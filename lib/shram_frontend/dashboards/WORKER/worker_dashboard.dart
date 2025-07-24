import 'package:flutter/material.dart';

class WorkerDashboard extends StatefulWidget {
  @override
  State<WorkerDashboard> createState() => _WorkerDashboardState();
}

class _WorkerDashboardState extends State<WorkerDashboard> {
  int _selectedIndex = 0;
  int profileViews = 0;
  int appliedJobs = 0;
  int interviewCount = 0;
  int availableVacancyCount = 0;

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });

    switch (index) {
      case 1:
        Navigator.pushNamed(context, '/search_work');
        break;
      case 2:
        Navigator.pushNamed(context, '/worker_profile');
        break;
      case 3:
        Navigator.pushNamed(context, '/worker_more');
        break;
    }
  }

  Widget buildTopCard({
    required String title,
    required IconData icon,
    required int count,
    required VoidCallback onTap,
    required Color backgroundColor,
  }) {
    return Expanded(
      child: GestureDetector(
        onTap: onTap,
        child: Card(
          color: backgroundColor,
          elevation: 10,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(18),
          ),
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 10),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  title,
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.bold,
                      color: Colors.black),
                ),
                SizedBox(height: 10),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(icon, size: 26, color: Colors.white),
                    SizedBox(width: 10),
                    Text(
                      "$count",
                      style: TextStyle(
                          fontSize: 24,
                          fontWeight: FontWeight.bold,
                          color: Colors.black87),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Container(height: 30, color: Color(0xFFFF6F00)),
          Container(
            height: 50,
            width: double.infinity,
            color: Color(0xFFFF6F00),
            child: Center(
              child: Text(
                "WORKER DASHBOARD",
                style: TextStyle(
                    fontSize: 22,
                    fontWeight: FontWeight.bold,
                    color: Colors.black),
              ),
            ),
          ),
          Expanded(
            child: SingleChildScrollView(
              padding: EdgeInsets.all(14),
              child: Column(
                children: [
                  /// --- Dashboard Top Cards ---
                  Row(
                    children: [
                      buildTopCard(
                        title: "Available Vacancies",
                        icon: Icons.work,
                        count: availableVacancyCount,
                        onTap: () {
                          Navigator.pushNamed(context, '/available_vacancies');
                        },
                        backgroundColor: Color(0xFF81C784),
                      ),
                      SizedBox(width: 10),
                      buildTopCard(
                        title: "Profile View & Rating",
                        icon: Icons.visibility,
                        count: profileViews,
                        onTap: () {
                          Navigator.pushNamed(context, '/profile_views');
                        },
                        backgroundColor: Color(0xFF4FC3F7),
                      ),
                    ],
                  ),
                  SizedBox(height: 14),
                  Row(
                    children: [
                      buildTopCard(
                        title: "Jobs Applied",
                        icon: Icons.assignment_turned_in,
                        count: appliedJobs,
                        onTap: () {
                          Navigator.pushNamed(context, '/job_applied');
                        },
                        backgroundColor: Color(0xFFFF8A80),
                      ),
                      SizedBox(width: 10),
                      buildTopCard(
                        title: "Interview Schedule",
                        icon: Icons.schedule,
                        count: interviewCount,
                        onTap: () {
                          Navigator.pushNamed(context, '/interview_schedule');
                        },
                        backgroundColor: Color(0xFFFFAB40),
                      ),
                    ],
                  ),

                  SizedBox(height: 30),

                  /// --- Useful Info Section ---
                  Align(
                    alignment: Alignment.center,
                    child: Text(
                      "Helpful Tips for Workers :-",
                      style: TextStyle(
                        fontSize: 22,
                        fontWeight: FontWeight.bold,
                        color: Colors.orange.shade900,
                      ),
                    ),
                  ),
                  SizedBox(height: 25),

                  Card(
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12)),
                    elevation: 4,
                    color: Colors.orange.shade50,

                    child: Container(height: 80,
                      child: ListTile(

                        leading: Icon(Icons.verified_user, color: Colors.green),
                        title: Text("Keep your profile updated"),
                        subtitle: Text("Updated profiles get more job offers."),
                      ),
                    ),
                  ),
                  SizedBox(height: 20),
                  Card(
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12)),
                    elevation: 4,
                    color: Colors.orange.shade50,
                    child: Container(
                      height: 80,
                      child: ListTile(
                        leading: Icon(Icons.schedule, color: Colors.blue),
                        title: Text("Check interview schedules regularly"),
                        subtitle:
                        Text("Don't miss any important updates."),
                      ),
                    ),
                  ),
                  SizedBox(height: 20),
                  Card(
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12)),
                    elevation: 4,
                    color: Colors.orange.shade50,
                    child: Container(
                      height: 80,
                      child: ListTile(
                        leading: Icon(Icons.star, color: Colors.amber),
                        title: Text("Improve your rating"),
                        subtitle:
                        Text("Get good reviews by completing jobs on time."),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        currentIndex: _selectedIndex,
        onTap: _onItemTapped,
        selectedItemColor: Colors.white,
        backgroundColor: Color(0xFFFF6F00),
        unselectedItemColor: Colors.black,
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home, size: 30), label: 'Home'),
          BottomNavigationBarItem(icon: Icon(Icons.search, size: 30), label: 'Search'),
          BottomNavigationBarItem(icon: Icon(Icons.person, size: 30), label: 'Profile'),
          BottomNavigationBarItem(icon: Icon(Icons.settings, size: 30), label: 'More'),
        ],
      ),
    );
  }
}
// import 'package:flutter/material.dart';
//
// class DummyPage extends StatelessWidget {
//   final String title;
//
//   const DummyPage({super.key, required this.title});
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(title: Text(title)),
//       body: Center(
//         child: Text(
//           '$title Page',
//           style: TextStyle(fontSize: 24),
//         ),
//       ),
//     );
//   }
// }
// class WorkerDashboard extends StatefulWidget {
//   @override
//   State<WorkerDashboard> createState() => _WorkerDashboardState();
// }
//
// class _WorkerDashboardState extends State<WorkerDashboard> {
//   int _selectedIndex = 0;
//
//   int profileViews = 0;
//   int appliedJobs = 0;
//   int interviewCount = 0;
//   int availableVacancyCount = 0;
//
//   void _onItemTapped(int index) {
//     setState(() {
//       _selectedIndex = index;
//     });
//
//     switch (index) {
//       case 1:
//       // Navigate to Search
//         Navigator.pushNamed(context, '/search_work');
//         break;
//       case 2:
//         Navigator.pushNamed(context, '/worker_profile');
//         break;
//       case 3:
//       // Navigate to View Profile
//         Navigator.pushNamed(context, '/worker_more');
//         break;
//     }
//   }
//
//   Widget buildTopCard({
//     required String title,
//     required IconData icon,
//     required int count,
//     required VoidCallback onTap,
//     required Color backgroundColor,
//   }) {
//     return Expanded(
//       child: GestureDetector(
//         onTap: onTap,
//         child: Card(
//           color: backgroundColor,
//           elevation: 10,
//           shape: RoundedRectangleBorder(
//             borderRadius: BorderRadius.circular(18),
//           ),
//           child: Padding(
//             padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 10),
//             child: Column(
//               mainAxisAlignment: MainAxisAlignment.center,
//               children: [
//                 Text(
//                   title,
//                   textAlign: TextAlign.center,
//                   style: TextStyle(
//                       fontSize: 14,
//                       fontWeight: FontWeight.bold,
//                       color: Colors.black),
//                 ),
//                 SizedBox(height: 10),
//                 Row(
//                   mainAxisAlignment: MainAxisAlignment.center,
//                   children: [
//                     Icon(icon, size: 26, color: Colors.white),
//                     SizedBox(width: 10),
//                     Text(
//                       "$count",
//                       style: TextStyle(
//                           fontSize: 24,
//                           fontWeight: FontWeight.bold,
//                           color: Colors.black87),
//                     ),
//                   ],
//                 ),
//               ],
//             ),
//           ),
//         ),
//       ),
//     );
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: Column(
//         children: [
//           Container(height: 30, color: Color(0xFFFF6F00)),
//           Container(
//             height: 50,
//             width: double.infinity,
//             color: Color(0xFFFF6F00),
//             child: Center(
//               child: Text(
//                 "WORKER DASHBOARD",
//                 style: TextStyle(
//                     fontSize: 22,
//                     fontWeight: FontWeight.bold,
//                     color: Colors.black),
//               ),
//             ),
//           ),
//           Expanded(
//             child: SingleChildScrollView(
//               padding: EdgeInsets.all(14),
//               child: Column(
//                 children: [
//                   Row(
//                     children: [
//                       buildTopCard(
//                         title: "Available Vacancies",
//                         icon: Icons.work,
//                         count: availableVacancyCount,
//                         onTap: () {
//                           Navigator.pushNamed(context, '/available_vacancies');
//                         },
//                         backgroundColor: Color(0xFF81C784),
//                       ),
//                       SizedBox(width: 10),
//                       buildTopCard(
//                         title: "Profile View & Rating",
//                         icon: Icons.visibility,
//                         count: profileViews,
//                         onTap: () {
//                           Navigator.pushNamed(context, '/profile_views');
//                         },
//                         backgroundColor: Color(0xFF4FC3F7),
//                       ),
//                     ],
//                   ),
//                   SizedBox(height: 14),
//                   Row(
//                     children: [
//                       buildTopCard(
//                         title: "Jobs Applied",
//                         icon: Icons.assignment_turned_in,
//                         count: appliedJobs,
//                         onTap: () {
//                           Navigator.pushNamed(context, '/job_applied');
//                         },
//                         backgroundColor: Color(0xFFFF8A80),
//                       ),
//                       SizedBox(width: 10),
//                       buildTopCard(
//                         title: "Interview Schedule",
//                         icon: Icons.schedule,
//                         count: interviewCount,
//                         onTap: () {
//                           Navigator.pushNamed(context, '/interview_schedule');
//                         },
//                         backgroundColor: Color(0xFFFFAB40),
//                       ),
//                     ],
//                   ),
//                 ],
//               ),
//             ),
//           ),
//         ],
//       ),
//       bottomNavigationBar: BottomNavigationBar(
//         type: BottomNavigationBarType.fixed,
//         currentIndex: _selectedIndex,
//         onTap: _onItemTapped,
//         selectedItemColor: Colors.white,
//         backgroundColor: Color(0xFFFF6F00),
//         unselectedItemColor: Colors.black,
//         items: const [
//           BottomNavigationBarItem(icon: Icon(Icons.home, size: 30), label: 'Home'),
//           BottomNavigationBarItem(icon: Icon(Icons.search, size: 30), label: 'Search'),
//           BottomNavigationBarItem(icon: Icon(Icons.person, size: 30), label: 'Profile'),
//           BottomNavigationBarItem(icon: Icon(Icons.settings, size: 30), label: 'More'),
//         ],
//       ),
//     );
//   }
// }