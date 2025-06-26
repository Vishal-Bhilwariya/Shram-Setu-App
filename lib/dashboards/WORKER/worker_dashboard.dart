import 'package:flutter/material.dart';

class WorkerDashboard extends StatefulWidget {
  @override
  State<WorkerDashboard> createState() => _WorkerDashboardState();
}

class _WorkerDashboardState extends State<WorkerDashboard> {
  int _selectedIndex = 0;

  // Dummy count data
  int profileViews =0;
  int appliedJobs = 0;
  int interviewCount = 0;
  int availableVacancyCount = 0;

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
    switch (index) {
      case 1:
      // Navigate to Search
        break;
      case 2:
        Navigator.pushNamed(context, '/add_worker_profile');
        break;
      case 3:
      // Navigate to View Profile
        break;
      case 4:
      // More
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
          elevation: 15,
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(22)),
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 30),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  height: 45,width: 100,
                  child: Text(
                    title,
                    textAlign: TextAlign.center,
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                  ),
                ),
                Container(height: 5,),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    const SizedBox(width: 40),
                    Icon(icon, size: 30, color: Colors.white),
                    const SizedBox(width: 24),
                    Text(
                      "$count",
                      style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold, color: Colors.black87),
                    ),
                  ]
                ),
                const SizedBox(height: 4),
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
      // appBar: AppBar(
      //   elevation: 0,
      //   backgroundColor: Color(0xFFFF6F00),
      //   title: Text(
      //     "Worker Dashboard",
      //     style: TextStyle(
      //       fontWeight: FontWeight.bold,
      //       fontSize: 22,
      //       color: Colors.white,
      //     ),
      //   ),
      //   centerTitle: true,
      // ),
      body: Column(
        children: [
          Container(height: 30,color: Color(0xFFFF6F00),),
          Container(
            height: 50,
            width: double.infinity,
            color: Color(0xFFFF6F00),
            child: Text(
              "WORKER DASHBOARD",
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 25,fontWeight: FontWeight.bold,color: Colors.black,),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(14.0),
            child: Column(
              children: [
                Row(
                  children: [
                    buildTopCard(
                      title: "Available Vacancies",
                      icon: Icons.work,
                      count: availableVacancyCount,
                      onTap: () {
                        Navigator.pushNamed(context, '/available_vacancies');
                      },
                      backgroundColor: Color(0xFF81C784), // Soft Orange
                    ),
                    const SizedBox(width: 10),
                    buildTopCard(
                      title: "Profile View & Rating",
                      icon: Icons.visibility,
                      count: profileViews,
                      onTap: () {
                        Navigator.pushNamed(context, '/profile_views');
                      },
                      backgroundColor: Color(0xFF4FC3F7), // Light Blue
                    ),
                  ],
                ),
                const SizedBox(height: 14),
                Row(
                  children: [
                    buildTopCard(
                      title: "Jobs Applied",
                      icon: Icons.assignment_turned_in,
                      count: appliedJobs,
                      onTap: () {
                        Navigator.pushNamed(context, '/job_applied');
                      },
                      backgroundColor: Color(0xFFFF8A80), // Light Green
                    ),
                    const SizedBox(width: 10),
                    buildTopCard(
                      title: "Interview Schedule",
                      icon: Icons.schedule,
                      count: interviewCount,
                      onTap: () {
                        Navigator.pushNamed(context, '/interview_schedule');
                      },
                      backgroundColor: Color(0xFFFFAB40), // Light Pink
                    ),
                  ],
                ),
              ],
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
          BottomNavigationBarItem(icon: Icon(Icons.home,size: 35,), label: 'Home'),
          BottomNavigationBarItem(icon: Icon(Icons.search,size: 35,), label: 'Search'),
          BottomNavigationBarItem(icon: Icon(Icons.add_circle,size: 35,), label: 'Add'),
          BottomNavigationBarItem(icon: Icon(Icons.person,size: 35,), label: 'Profile'),
          BottomNavigationBarItem(icon: Icon(Icons.settings,size: 35,), label: 'More'),
        ],
      ),
    );
  }
}
