import 'package:flutter/material.dart';

class AvailableVacancies extends StatefulWidget {
  @override
  State<AvailableVacancies> createState() => _AvailableVacanciesState();
}

class _AvailableVacanciesState extends State<AvailableVacancies> {
  int _selectedIndex = 0;
  String selectedFilter = "All";

  final List<Map<String, String>> allVacancies = [
    {
      "title": "Need Electrician for Shop",
      "location": "Connaught Place",
      "wage": "₹600/day",
      "duration": "2 Days",
      "postedBy": "Ajay Kumar",
      "datePosted": "27 June 2025",
      "type": "One-Time"
    },
    {
      "title": "Wiring work in Home",
      "location": "Lajpat Nagar",
      "wage": "₹550/day",
      "duration": "1 Day",
      "postedBy": "Pooja Sharma",
      "datePosted": "25 June 2025",
      "type": "One-Time"
    },
    {
      "title": "Electric board repair",
      "location": "Saket",
      "wage": "₹500/day",
      "duration": "Half Day",
      "postedBy": "Manish Verma",
      "datePosted": "24 June 2025",
      "type": "One-Time"
    },
    {
      "title": "Flutter Intern",
      "location": "Noida",
      "wage": "₹1000/day",
      "duration": "7 Days",
      "postedBy": "Tech Corp HR",
      "datePosted": "23 June 2025",
      "type": "Internship"
    },
    {
      "title": "Software Engineer Intern",
      "location": "Noida",
      "wage": "₹15000/month",
      "duration": "2 Months",
      "postedBy": "InnovateX Pvt Ltd",
      "datePosted": "22 June 2025",
      "type": "Internship"
    },
    {
      "title": "Need Carpenter",
      "location": "Agra",
      "wage": "₹550/day",
      "duration": "Depends on work",
      "postedBy": "Vinod Construction",
      "datePosted": "20 June 2025",
      "type": "Contract"
    }
  ];

  List<Map<String, String>> get filteredVacancies {
    if (selectedFilter == "All") return allVacancies;
    return allVacancies.where((job) => job["duration"] == selectedFilter).toList();
  }

  void _onItemTapped(int index) {
    setState(() => _selectedIndex = index);
    switch (index) {
      case 0:
        Navigator.pushNamed(context, '/worker_dashboard');
        break;
      case 1:
        Navigator.pushNamed(context, '/worker_profile');
        break;
      case 2:
      // Search
        break;
      case 3:
      // More
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
      onSelected: (_) => setState(() => selectedFilter = label),
    );
  }

  IconData getCategoryIcon(String title) {
    title = title.toLowerCase();
    if (title.contains("electric")) return Icons.electrical_services;
    if (title.contains("carpenter")) return Icons.handyman;
    if (title.contains("paint")) return Icons.format_paint;
    if (title.contains("software") || title.contains("flutter")) return Icons.computer;
    return Icons.work;
  }

  Color getTagColor(String type) {
    switch (type.toLowerCase()) {
      case "internship":
        return Colors.blueAccent;
      case "contract":
        return Colors.teal;
      case "one-time":
        return Colors.orange;
      default:
        return Colors.grey;
    }
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
          BottomNavigationBarItem(icon: Icon(Icons.home, size: 30), label: 'Dashboard'),
          BottomNavigationBarItem(icon: Icon(Icons.person, size: 30), label: 'Profile'),
          BottomNavigationBarItem(icon: Icon(Icons.search, size: 30), label: 'Search'),
          BottomNavigationBarItem(icon: Icon(Icons.settings, size: 30), label: 'More'),
        ],
      ),
    );
  }

  Widget _buildJobCard(Map<String, String> job) {
    final String jobType = job["type"] ?? "Job";

    return Card(
      margin: const EdgeInsets.symmetric(vertical: 6),
      elevation: 3,
      child: ListTile(
        leading: Icon(getCategoryIcon(job["title"] ?? ""), color: Color(0xFFFF6F00), size: 36),
        title: Row(
          children: [
            Expanded(child: Text(job["title"] ?? "")),
            Container(
              padding: EdgeInsets.symmetric(horizontal: 8, vertical: 4),
              decoration: BoxDecoration(
                color: getTagColor(jobType),
                borderRadius: BorderRadius.circular(10),
              ),
              child: Text(
                jobType,
                style: TextStyle(color: Colors.white, fontSize: 12),
              ),
            )
          ],
        ),
        subtitle: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text("📍 ${job["location"]}"),
            Text("💰 ${job["wage"]}"),
            Text("🕒 ${job["duration"]} • 🗓 ${job["datePosted"]}"),
          ],
        ),
        trailing: Icon(Icons.arrow_forward_ios, size: 16),
        onTap: () {
          showDialog(
            context: context,
            builder: (BuildContext context) => AlertDialog(
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
              title: Text(job["title"] ?? "Job Details"),
              content: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text("📍 Location: ${job["location"]}"),
                  Text("💰 Wage: ${job["wage"]}"),
                  Text("🕒 Duration: ${job["duration"]}"),
                  Text("🏷 Type: $jobType"),
                  Text("🗓 Date Posted: ${job["datePosted"]}"),
                  SizedBox(height: 6),
                  Text("🧑‍💼 Posted by: ${job["postedBy"]}"),
                ],
              ),
              actions: [
                TextButton(
                  onPressed: () => Navigator.of(context).pop(),
                  child: Text("Close"),
                ),
                ElevatedButton(
                  onPressed: () {
                    Navigator.of(context).pop();
                    // handle apply
                  },
                  style: ElevatedButton.styleFrom(backgroundColor: Color(0xFFFF6F00)),
                  child: Text("Apply Now"),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
