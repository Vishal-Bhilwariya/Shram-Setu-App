import 'package:flutter/material.dart';

class HirerDashboard extends StatelessWidget {
  final List<Map<String, String>> workers = [
    {
      "name": "Ravi Kumar",
      "profession": "Electrician",
      "location": "Delhi",
      "fees": "₹500/day",
      "availability": "Available"
    },
    {
      "name": "Suresh Patel",
      "profession": "Plumber",
      "location": "Jaipur",
      "fees": "₹450/day",
      "availability": "Not Available"
    },
    {
      "name": "Amit Sharma",
      "profession": "Carpenter",
      "location": "Bhopal",
      "fees": "₹600/day",
      "availability": "Available"
    }
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Color(0xFFFF6F00),
        title: Text(
          "Hirer Dashboard",
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 22,
            color: Colors.white,
          ),
        ),
        centerTitle: true,
      ),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            DrawerHeader(
              decoration: BoxDecoration(color: Color(0xFFFF6F00)),

              child: Text("Hirer Menu", style: TextStyle(color: Colors.white, fontSize: 22)),
            ),
            ListTile(
              leading: Icon(Icons.person),
              title: Text("Profile"),
              onTap: () {},
            ),
            ListTile(
              leading: Icon(Icons.visibility),
              title: Text("View Applied"),
              onTap: () {},
            ),
            ListTile(
              leading: Icon(Icons.search),
              title: Text("Search Nearby"),
              onTap: () {},
            ),
            ListTile(
              leading: Icon(Icons.logout),
              title: Text("Logout"),
              onTap: () {},
            ),
          ],
        ),
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
