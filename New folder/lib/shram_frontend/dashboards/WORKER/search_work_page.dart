import 'package:flutter/material.dart';

class SearchWorkPage extends StatefulWidget {
  @override
  _SearchWorkPageState createState() => _SearchWorkPageState();
}

class _SearchWorkPageState extends State<SearchWorkPage> {
  final List<Map<String, String>> allJobs = [
    {
      "title": "Electric Wiring at Home",
      "location": "Delhi",
      "wage": "₹600/day",
      "duration": "2 Days"
    },
    {
      "title": "Bathroom Plumbing Fix",
      "location": "Lucknow",
      "wage": "₹550/day",
      "duration": "1 Day"
    },
    {
      "title": "Wood Furniture Work",
      "location": "Agra",
      "wage": "₹700/day",
      "duration": "3 Days"
    },
    {
      "title": "AC Repair Needed",
      "location": "Noida",
      "wage": "₹800/day",
      "duration": "1 Day"
    },
  ];

  String searchQuery = "";

  List<Map<String, String>> get filteredJobs {
    if (searchQuery.isEmpty) return allJobs;
    return allJobs
        .where((job) =>
    job['title']!.toLowerCase().contains(searchQuery.toLowerCase()) ||
        job['location']!.toLowerCase().contains(searchQuery.toLowerCase()))
        .toList();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Search Work"),
        backgroundColor: Color(0xFFFF6F00),
      ),
      body: Padding(
        padding: const EdgeInsets.all(14.0),
        child: Column(
          children: [
            TextField(
              decoration: InputDecoration(
                hintText: 'Search by title or location...',
                prefixIcon: Icon(Icons.search),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
              ),
              onChanged: (value) {
                setState(() {
                  searchQuery = value;
                });
              },
            ),
            SizedBox(height: 16),
            Expanded(
              child: filteredJobs.isEmpty
                  ? Center(
                child: Text("No matching work found.",
                    style: TextStyle(color: Colors.grey)),
              )
                  : ListView.builder(
                itemCount: filteredJobs.length,
                itemBuilder: (context, index) {
                  final job = filteredJobs[index];
                  return Card(
                    elevation: 3,
                    margin: EdgeInsets.symmetric(vertical: 8),
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10)),
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
                        // Navigate to job details if needed
                      },
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
