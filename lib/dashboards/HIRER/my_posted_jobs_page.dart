import 'package:flutter/material.dart';

class MyPostedJobsPage extends StatefulWidget {
  @override
  _MyPostedJobsPageState createState() => _MyPostedJobsPageState();
}

class _MyPostedJobsPageState extends State<MyPostedJobsPage> {
  List<Map<String, String>> postedJobs = [
    {
      "title": "Electrician Needed for Wiring",
      "location": "New Delhi",
      "wage": "₹600/day",
      "duration": "2 days"
    },
    {
      "title": "Painter Required",
      "location": "Lucknow",
      "wage": "₹500/day",
      "duration": "3 days"
    },
    {
      "title": "Plumber for Bathroom Fix",
      "location": "Agra",
      "wage": "₹550/day",
      "duration": "1 day"
    },
  ];

  void _deleteJob(int index) {
    setState(() {
      postedJobs.removeAt(index);
    });
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text("Job removed successfully")),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("My Posted Jobs"),
        backgroundColor: Color(0xFFFF6F00),
      ),
      body: postedJobs.isEmpty
          ? Center(
        child: Text(
          "No jobs posted yet.",
          style: TextStyle(fontSize: 16, color: Colors.grey),
        ),
      )
          : ListView.builder(
        itemCount: postedJobs.length,
        padding: EdgeInsets.all(12),
        itemBuilder: (context, index) {
          final job = postedJobs[index];
          return Card(
            elevation: 4,
            margin: EdgeInsets.symmetric(vertical: 8),
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
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
              trailing: IconButton(
                icon: Icon(Icons.delete, color: Colors.red),
                onPressed: () => _deleteJob(index),
              ),
            ),
          );
        },
      ),
    );
  }
}
