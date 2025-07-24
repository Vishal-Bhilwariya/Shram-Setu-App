import 'package:flutter/material.dart';
import 'package:shram_setu_project/shram_frontend/dashboards/HIRER/worker_profile_view.dart';

class AvailableWorkers extends StatelessWidget {
  final List<Map<String, String>> workers = [
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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Color(0xFFFF6F00),
        title: Text(
          "Available Workers",
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 22,
            color: Colors.white,
          ),
        ),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text("Available Workers", style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
            SizedBox(height: 12),
            Expanded(
              child: ListView.builder(
                itemCount: workers.length,
                itemBuilder: (context, index) {
                  final worker = workers[index];
                  return Card(
                    elevation: 4,
                    margin: const EdgeInsets.symmetric(vertical: 8),
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
                    child: ListTile(
                      leading: CircleAvatar(
                        backgroundColor: Color(0xFFFF6F00),
                        child: Text(worker["name"]![0], style: TextStyle(color: Colors.white)),
                      ),
                      title: Text(worker["name"]!),
                      subtitle: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text("Profession: ${worker["profession"]}"),
                          Text("Location: ${worker["location"]}"),
                          Text("Fees: ${worker["fees"]}"),
                          Text("Availability: ${worker["availability"]}"),
                        ],
                      ),
                      trailing: Icon(Icons.arrow_forward_ios),
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => WorkerProfileView(name: worker["name"]!, profession: worker["profession"]!, experience: worker["experience"]!, location: worker["location"]!, fees: worker["fees"]!, desciption: worker["description"]!,availability: worker["availability"]!,))
                        );
                        // Open detail page or hire option
                      },
                    ),
                  );
                },
              ),
            ),
            SizedBox(height: 12),
            ElevatedButton.icon(
              icon: Icon(Icons.post_add),
              label: Text("Create Vacancy",style: TextStyle(color: Colors.white),),
              style: ElevatedButton.styleFrom(
                backgroundColor: Color(0xFFFF6F00),
                minimumSize: Size(double.infinity, 48),
              ),
              onPressed: () {
                // Navigate to vacancy creation screen
              },
            )
          ],
        ),
      ),
    );
  }
}
