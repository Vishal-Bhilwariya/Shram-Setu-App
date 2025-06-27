import 'package:flutter/material.dart';

class ViewApplicantsPage extends StatelessWidget {
  final List<Map<String, String>> applicants = [
    {
      "name": "Vishal",
      "profession": "Electrician",
      "location": "Agra",
      "experience": "5 years"
    },
    {
      "name": "Manvendra",
      "profession": "Plumber",
      "location": "Lucknow",
      "experience": "3 years"
    },
    {
      "name": "Bhavatosh",
      "profession": "Carpenter",
      "location": "Delhi",
      "experience": "4 years"
    }
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Applicants"),
        backgroundColor: Color(0xFFFF6F00),
      ),
      body: applicants.isEmpty
          ? Center(
        child: Text(
          "No applicants yet.",
          style: TextStyle(fontSize: 16, color: Colors.grey),
        ),
      )
          : ListView.builder(
        itemCount: applicants.length,
        padding: EdgeInsets.all(14),
        itemBuilder: (context, index) {
          final applicant = applicants[index];
          return Card(
            elevation: 4,
            margin: EdgeInsets.symmetric(vertical: 8),
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12)),
            child: ListTile(
              leading: CircleAvatar(
                radius: 28,
                backgroundColor: Colors.orange.shade100,
                child: Icon(Icons.person, size: 30, color: Color(0xFFFF6F00)),
              ),
              title: Text(
                applicant["name"] ?? "",
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              subtitle: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text("Profession: ${applicant["profession"]}"),
                  Text("Location: ${applicant["location"]}"),
                  Text("Experience: ${applicant["experience"]}"),
                ],
              ),
              trailing: ElevatedButton(
                onPressed: () {
                  // Navigate to profile page
                  Navigator.pushNamed(context, '/worker_profile_view');
                },
                child: Text("View"),
                style: ElevatedButton.styleFrom(
                  backgroundColor: Color(0xFFFF6F00),
                  foregroundColor: Colors.white,
                  padding:
                  EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8)),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
