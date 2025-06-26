import 'package:flutter/material.dart';

class AvailableVacancies extends StatefulWidget {
  @override
  State<AvailableVacancies> createState() => _AvailableVacanciesState();
}

class _AvailableVacanciesState extends State<AvailableVacancies> {
  int _selectedIndex = 0;
  String selectedFilter = "All";

  final String workerName = "Ramu Bhai";
  final String profession = "Electrician";
  final String location = "Agra";
  final String fees = "₹500/day";
  final bool isAvailable = true;

  final List<Map<String, String>> allVacancies = [
    {
      "title": "Need Electrician for Shop",
      "location": "Connaught Place",
      "wage": "₹600/day",
      "duration": "2 Days"
    },
    {
      "title": "Wiring work in Home",
      "location": "Lajpat Nagar",
      "wage": "₹550/day",
      "duration": "1 Day"
    },
    {
      "title": "Electric board repair",
      "location": "Saket",
      "wage": "₹500/day",
      "duration": "Half Day"
    },
    {
    "title": "Flutter Intern",
    "location": "Noida",
    "wage": "₹1000/day",
    "duration": "7 Days"
    },
    {
    "title": "Software Engineer Intern",
    "location": "Noida",
    "wage": "₹15000/month",
    "duration": "2 Months"
    },
    {
      "title": "Need Carpenter",
      "location": "Agra",
      "wage": "₹550/day",
      "duration": "Depends on work"
    }
  ];

  List<Map<String, String>> get filteredVacancies {
    if (selectedFilter == "All") return allVacancies;
    return allVacancies
        .where((job) => job["duration"] == selectedFilter)
        .toList();
  }

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
    switch (index) {
      case 0:
        Navigator.pushNamed(context, '/worker_dashboard');
        break;
      case 1:
        Navigator.pushNamed(context, '/worker_profile');
        break;
      case 2:
      // Search functionality
        break;
      case 3:
      // More/settings
        break;
    }
  }

  Widget buildFilterChip(String label) {
    final isSelected = selectedFilter == label;
    return ChoiceChip(
      label: Text(label,
          style: TextStyle(color: isSelected ? Colors.white : Colors.black)),
      selected: isSelected,
      selectedColor: Color(0xFFFF6F00),
      backgroundColor: Colors.grey.shade200,
      onSelected: (_) {
        setState(() {
          selectedFilter = label;
        });
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Available Vacancies"),
        backgroundColor: Color(0xFFFF6F00),
      ),
      body: ListView(
        padding: const EdgeInsets.all(14.0),
        children: [
          _buildProfileCard(),
          const SizedBox(height: 18),
          Text("Filter by Duration", style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600)),
          const SizedBox(height: 10),
          Wrap(
            spacing: 10,
            children: [
              buildFilterChip("All"),
              buildFilterChip("1 Day"),
              buildFilterChip("2 Days"),
              buildFilterChip("Half Day"),
            ],
          ),
          const SizedBox(height: 20),
          Text("Available Job Vacancies",
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
          const SizedBox(height: 10),
          ...filteredVacancies.map((job) => _buildJobCard(job)).toList(),
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _selectedIndex,
        onTap: _onItemTapped,
        selectedItemColor: Colors.white,
        backgroundColor: Color(0xFFFF6F00),
        unselectedItemColor: Colors.black,
        type: BottomNavigationBarType.fixed,
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home,size: 35,), label: 'Dashboard'),
          BottomNavigationBarItem(icon: Icon(Icons.search,size: 35,), label: 'Search'),
          BottomNavigationBarItem(icon: Icon(Icons.person,size: 35,), label: 'Profile'),
          BottomNavigationBarItem(icon: Icon(Icons.settings,size: 35), label: 'More'),
        ],
      ),
    );
  }

  Widget _buildProfileCard() {
    return Card(
      elevation: 4,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Row(
          children: [
            Icon(Icons.account_circle, size: 48, color: Color(0xFFFF6F00)),
            const SizedBox(width: 16),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(workerName,
                      style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
                  Text(profession),
                  Text("Location: $location"),
                  Text("Fees: $fees"),
                  Text("Available: ${isAvailable ? "Yes" : "No"}"),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildJobCard(Map<String, String> job) {
    return Card(
      margin: const EdgeInsets.symmetric(vertical: 6),
      elevation: 3,
      child: ListTile(
        leading: Icon(Icons.work, color: Color(0xFFFF6F00)),
        title: Text(job["title"] ?? ""),
        subtitle: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text("Location: ${job["location"]}"),
            Text("Wage: ${job["wage"]}"),
            Text("Duration: ${job["duration"]}"),
          ],
        ),
        trailing: Icon(Icons.arrow_forward_ios, size: 16),
        onTap: () {
          // navigate to job details if needed
        },
      ),
    );
  }
}