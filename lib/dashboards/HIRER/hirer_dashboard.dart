import 'package:flutter/material.dart';

class HirerDashboard extends StatefulWidget {
  const HirerDashboard({Key? key}) : super(key: key);

  @override
  _HirerDashboardState createState() => _HirerDashboardState();
}

class _HirerDashboardState extends State<HirerDashboard> {
  int _selectedIndex = 0;

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });

    switch (index) {
      case 1:
        Navigator.pushNamed(context, '/search_workers');
        break;
      case 2:
        Navigator.pushNamed(context, '/hirer_profile');
        break;
      case 3:
      // Navigate to View Profile
        Navigator.pushNamed(context, '/worker_more');
        break;
    }
  }

  Widget buildDashboardCard({required IconData icon, required String label, required VoidCallback onTap, Color? bgColor}) {
    return Expanded(
      child: GestureDetector(
        onTap: onTap,
        child: Container(
          height: 100,
          margin: const EdgeInsets.all(8),
          decoration: BoxDecoration(
            color: bgColor ?? Colors.orange.shade100,
            borderRadius: BorderRadius.circular(16),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(icon, size: 30, color: Colors.deepOrange),
              const SizedBox(height: 8),
              Text(label, style: TextStyle(fontWeight: FontWeight.w600)),
            ],
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.orange.shade100,
      appBar: AppBar(
        backgroundColor: Colors.deepOrange,
        title: const Text("Welcome, Vishal!"),
        centerTitle: true,
        actions: const [
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 16),
            child: Icon(Icons.account_circle, size: 28),
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(12),
        child: Column(
          children: [
            Row(
              children: [
                buildDashboardCard(
                  icon: Icons.add,
                  label: 'Post a Job',
                  onTap: () => Navigator.pushNamed(context, '/post_job'),
                  bgColor: Colors.green.shade300,
                ),
                buildDashboardCard(
                  icon: Icons.person,
                  label: 'View Applicants',
                  onTap: () => Navigator.pushNamed(context, '/view_applicants'),
                  bgColor: Colors.yellow.shade200,
                ),
              ],
            ),
            Row(
              children: [
                buildDashboardCard(
                  icon: Icons.people,
                  label: 'Available Workers',
                  onTap: () => Navigator.pushNamed(context, '/available_worker'),
                  bgColor: Colors.blue.shade100,
                ),
                buildDashboardCard(
                  icon: Icons.list_alt,
                  label: 'My Posted Jobs',
                  onTap: () => Navigator.pushNamed(context, '/my_posted_job'),
                  bgColor: Colors.pink.shade100,
                ),
              ],
            ),
            const SizedBox(height: 20),
            Container(
              width: double.infinity,
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: Colors.orange.shade50,
                borderRadius: BorderRadius.circular(16),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text("Past Workers",
                      style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.deepOrange),
                    onPressed: () => Navigator.pushNamed(context, '/past_workers'),
                    child: const Text("View"),
                  )
                ],
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _selectedIndex,
        onTap: _onItemTapped,
        selectedItemColor: Colors.black,
        backgroundColor: Colors.deepOrange,
        unselectedItemColor: Colors.white,
        type: BottomNavigationBarType.fixed,
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home,size: 30,), label: 'Home'),
          BottomNavigationBarItem(icon: Icon(Icons.search,size: 30), label: 'Search'),
          BottomNavigationBarItem(icon: Icon(Icons.person,size: 30), label: 'Profile'),
          BottomNavigationBarItem(icon: Icon(Icons.settings, size: 30), label: 'More'),

        ],
      ),
    );
  }
}
