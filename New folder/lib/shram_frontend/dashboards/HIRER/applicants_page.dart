import 'package:flutter/material.dart';
import 'package:shram_setu_project/shram_frontend/dashboards/HIRER/worker_profile_view.dart';

class ApplicantsPage extends StatelessWidget {
  // final String jobTitle;
  //
  // const ApplicantsPage({required this.jobTitle});

  @override
  Widget build(BuildContext context) {
    List<Map<String, String>> applicants = [
      {
        "name": "Ravi Kumar",
        "profession": "Electrician",
        "location": "Delhi",
        "fees": "₹500/day",
        "availability": "Yes",
        "description": "Skilled house painter with experience in residential interior and exterior projects",
        "experience" : "2 years"

      },
      {
        "name": "Suresh Patel",
        "profession": "Plumber",
        "location": "Jaipur",
        "fees": "₹450/day",
        "availability": "No",
        "experience" : "10 years",
        "description": "Skilled house painter with experience in residential interior and exterior projects",

      },
      {
        "name": "Amit Sharma",
        "profession": "Carpenter",
        "location": "Bhopal",
        "fees": "₹600/day",
        "availability": "Yes",
        "description": "Skilled house painter with experience in residential interior and exterior projects",
        "experience" : "5 years"
      }
    ];

    return Scaffold(
      appBar: AppBar(
        // title: Text("Applicants for $jobTitle"),
        title: Text("Applicants applied for this JOB"),
        backgroundColor: Color(0xFFFF6F00),
      ),
      body: ListView.builder(
        padding: EdgeInsets.all(14),
        itemCount: applicants.length,
        itemBuilder: (context, index) {
          final applicant = applicants[index];
          return Card(
            margin: EdgeInsets.symmetric(vertical: 8),
            elevation: 3,
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
            child: ListTile(
              leading: Icon(Icons.person, color: Color(0xFFFF6F00), size: 35),
              title: Text(applicant["name"] ?? ""),
              subtitle: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text("Profession: ${applicant["profession"]}"),
                  Text("Experience: ${applicant["experience"]}"),
                ],
              ),
              trailing: Icon(Icons.arrow_forward_ios, size: 16),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => WorkerProfileView(name: applicant["name"]!, profession: applicant["profession"]!, experience: applicant["experience"]!, location: applicant["location"]!, fees: applicant["fees"]!, desciption: applicant["description"]!,availability: applicant["availability"]!,)),
                );
                // You can navigate to applicant profile here
              },
            ),
          );
        },
      ),
    );
  }
}
