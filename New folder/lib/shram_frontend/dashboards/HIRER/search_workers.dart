import 'package:flutter/material.dart';

class SearchWorkersPage extends StatefulWidget {
  @override
  _SearchWorkersPageState createState() => _SearchWorkersPageState();
}

class _SearchWorkersPageState extends State<SearchWorkersPage> {
  List<Map<String, String>> workers = [
    {
      'name': 'Aditya',
      'profession': 'Electrician',
      'location': 'Delhi',
      'fees': '₹500/day',
      'image': 'assets/images/profile1.jpg'
    },
    {
      'name': 'Kartikey',
      'profession': 'Plumber',
      'location': 'Lucknow',
      'fees': '₹600/day',
      'image': 'assets/images/profile2.jpg'
    },
    {
      'name': 'Piyush',
      'profession': 'Carpenter',
      'location': 'Jaipur',
      'fees': '₹700/day',
      'image': 'assets/images/profile3.jpg'
    },
  ];

  String query = '';

  @override
  Widget build(BuildContext context) {
    final filteredWorkers = workers.where((worker) {
      final name = worker['name']!.toLowerCase();
      final profession = worker['profession']!.toLowerCase();
      final input = query.toLowerCase();
      return name.contains(input) || profession.contains(input);
    }).toList();

    return Scaffold(
      appBar: AppBar(
        title: Text("Search Workers"),

        backgroundColor: Color(0xFFFF6F00),
      ),
      body: Padding(
        padding: const EdgeInsets.all(14.0),
        child: Column(
          children: [
            TextField(
              decoration: InputDecoration(
                hintText: "Search by name or profession",
                prefixIcon: Icon(Icons.search),
                border: OutlineInputBorder(borderRadius: BorderRadius.circular(12)),
              ),
              onChanged: (value) {
                setState(() {
                  query = value;
                });
              },
            ),
            SizedBox(height: 20),
            Expanded(
              child: filteredWorkers.isEmpty
                  ? Center(child: Text("No workers found."))
                  : ListView.builder(
                itemCount: filteredWorkers.length,
                itemBuilder: (context, index) {
                  final worker = filteredWorkers[index];
                  return Card(
                    elevation: 4,
                    margin: const EdgeInsets.symmetric(vertical: 8),
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12)),
                    child: ListTile(
                      leading: CircleAvatar(
                        backgroundImage: AssetImage(worker['image']!),
                        radius: 28,
                      ),
                      title: Text(
                        worker['name']!,
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                      subtitle: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(worker['profession']!),
                          Text('Location: ${worker['location']}'),
                          Text('Fees: ${worker['fees']}'),
                        ],
                      ),
                      trailing: ElevatedButton(
                        onPressed: () {
                          // Navigate to profile or hire screen
                        },
                        style: ElevatedButton.styleFrom(
                            backgroundColor: Color(0xFFFF6F00)),
                        child: Text("Hire"),
                      ),
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
