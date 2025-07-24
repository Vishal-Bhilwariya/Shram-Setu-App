import 'package:flutter/material.dart';
import 'package:shram_setu_project/shram_frontend/dashboards/HIRER/worker_profile_view.dart';

class ViewApplicantsPage extends StatelessWidget {
  final List<Map<String, String>> applicants = [
    {
      "name": "Vishal",
      "profession": "Software Engineer",
      "location": "Agra",
      "fees": "₹50000/month",
      "availability": "Yes",
      "description": "Skills : DSA in Java , HTML , CSS , JAVASCRIPT , FLUTTER , DART",
      "experience" : "2 years"

    },
    {
      "name": "Lokendra",
      "profession": "Senior Developer",
      "location": "Mathura",
      "fees": "₹450/day",
      "availability": "No",
      "experience" : "10 years",
      "description": "Skills : DSA in Java , HTML , CSS , JAVASCRIPT ,React , Node js",

    },
    {
      "name": "Bhupendra",
      "profession": "Web Developer",
      "location": "Bhopal",
      "fees": "₹600/day",
      "availability": "Yes",
      "description": "Skills : DSA in Java , HTML , CSS , JAVASCRIPT",
      "experience" : "5 years"
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
                  Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => WorkerProfileView(name: applicant["name"]!, profession: applicant["profession"]!, experience: applicant["experience"]!, location: applicant["location"]!, fees: applicant["fees"]!, desciption: applicant["description"]!,availability: applicant["availability"]!,)),
                  );
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
