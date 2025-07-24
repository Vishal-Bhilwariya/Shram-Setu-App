import 'package:flutter/material.dart';

class JobsAppliedPage extends StatefulWidget {
  @override
  State<JobsAppliedPage> createState() => _JobsAppliedPageState();
}

class _JobsAppliedPageState extends State<JobsAppliedPage> {
  int _selectedIndex = 0;
  String selectedFilter = "All";

  final List<Map<String, String>> allJobs = [
    {
      "title": "Electrician for AC Repair",
      "company": "Bhavatosh",
      "status": "Pending",
      "date": "25 June 2025"
    },
    {
      "title": "Carpenter for Bed Work",
      "company": "Vishal",
      "status": "Shortlisted",
      "date": "22 June 2025"
    },
    {
      "title": "Plumber Needed",
      "company": "Piyush",
      "status": "Rejected",
      "date": "20 June 2025"
    },
    {
      "title": "Flutter Intern",
      "company": "Amazon",
      "status": "Pending",
      "date": "10 August 2025"
    },
    {
      "title": "Software Engineer Intern",
      "company": "Google",
      "status": "Shortlisted",
      "date": "23 July 2025"
    },
    {
      "title": "Need Carpenter",
      "company": "Aditya Singh",
      "status": "Rejected",
      "date": "20 June 2025"
    }
  ];

  List<Map<String, String>> get filteredJobs {
    if (selectedFilter == "All") return allJobs;
    return allJobs.where((job) => job['status'] == selectedFilter).toList();
  }

  Color getStatusColor(String status) {
    switch (status) {
      case 'Pending':
        return Colors.amber;
      case 'Shortlisted':
        return Colors.green;
      case 'Rejected':
        return Colors.red;
      default:
        return Colors.grey;
    }
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
      // Search feature
        break;
      case 3:
      // More or Settings
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
        title: Text("Jobs Applied"),
        backgroundColor: Color(0xFFFF6F00),
      ),
      body: Column(
        children: [
          // Filter Chips Row
          Padding(
            padding: const EdgeInsets.all(12.0),
            child: Wrap(
              spacing: 10,
              children: [
                buildFilterChip("All"),
                buildFilterChip("Shortlisted"),
                buildFilterChip("Pending"),
                buildFilterChip("Rejected"),
              ],
            ),
          ),
          Expanded(
            child: filteredJobs.isEmpty
                ? Center(child: Text("No jobs in this category."))
                : ListView.builder(
              padding: EdgeInsets.symmetric(horizontal: 14),
              itemCount: filteredJobs.length,
              itemBuilder: (context, index) {
                final job = filteredJobs[index];
                return Card(
                  elevation: 4,
                  margin: EdgeInsets.symmetric(vertical: 8),
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12)),
                  child: ListTile(
                    leading: CircleAvatar(
                      backgroundColor: Color(0xFFFF6F00),
                      child: Icon(Icons.work, color: Colors.white),
                    ),
                    title: Text(job["title"]!,
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 16)),
                    subtitle: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text("Posted by: ${job["company"]}"),
                        Text("Applied on: ${job["date"]}"),
                      ],
                    ),
                    trailing: Chip(
                      label: Text(job["status"]!,
                          style: TextStyle(color: Colors.white)),
                      backgroundColor: getStatusColor(job["status"]!),
                    ),
                  ),
                );
              },
            ),
          ),
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
}
