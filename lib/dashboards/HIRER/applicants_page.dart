import 'package:flutter/material.dart';

class ApplicantsPage extends StatelessWidget {
  // final String jobTitle;
  //
  // const ApplicantsPage({required this.jobTitle});

  @override
  Widget build(BuildContext context) {
    List<Map<String, String>> applicants = [
      {"name": "Kunal", "profession": "Electrician", "experience": "5 yrs"},
      {"name": "Gopal", "profession": "Painter", "experience": "3 yrs"},
      {"name": "Lakhan", "profession": "Plumber", "experience": "4 yrs"},
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
                Navigator.pushNamed(context, '/worker_profile_view');
                // You can navigate to applicant profile here
              },
            ),
          );
        },
      ),
    );
  }
}
