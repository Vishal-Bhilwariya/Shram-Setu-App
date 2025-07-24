import 'package:flutter/material.dart';

class PastWorkersPage extends StatelessWidget {
  final List<Map<String, dynamic>> pastWorkers = [
    {
      "name": "Vedant",
      "profession": "Electrician",
      "jobsDone": 3,
      "lastRating": 4.0,
      "overallRating": 4.7,
      "lastJob": "Fan Installation",
    },
    {
      "name": "Shashwat",
      "profession": "Painter",
      "jobsDone": 2,
      "lastRating": 5.0,
      "overallRating": 4.8,
      "lastJob": "Living Room Painting",
    },
    {
      "name": "Utkarsh",
      "profession": "Plumber",
      "jobsDone": 1,
      "lastRating": 3.5,
      "overallRating": 3.5,
      "lastJob": "Tap Leakage Fix",
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFF8F8F8),
      appBar: AppBar(
        backgroundColor: Color(0xFFFF6F00),
        title: Text("Past Workers"),
      ),
      body: ListView.builder(
        padding: EdgeInsets.all(16),
        itemCount: pastWorkers.length,
        itemBuilder: (context, index) {
          final worker = pastWorkers[index];
          return Container(
            margin: EdgeInsets.only(bottom: 16),
            padding: EdgeInsets.all(12),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(16),
              boxShadow: [
                BoxShadow(
                  color: Colors.black12,
                  blurRadius: 6,
                  offset: Offset(0, 4),
                ),
              ],
            ),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                CircleAvatar(
                  radius: 30,
                  backgroundColor: Color(0xFFFF6F00),
                  child: Icon(Icons.person, color: Colors.white, size: 30),
                ),
                SizedBox(width: 12),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(worker["name"],
                          style: TextStyle(
                              fontSize: 16, fontWeight: FontWeight.bold)),
                      Text(worker["profession"],
                          style: TextStyle(
                              fontSize: 14, color: Colors.grey[700])),
                      SizedBox(height: 4),
                      Text("Last Job: ${worker["lastJob"]}",
                          style: TextStyle(
                              fontSize: 13, color: Colors.grey[600])),
                      SizedBox(height: 6),
                      Row(
                        children: [
                          Icon(Icons.star, color: Colors.amber, size: 18),
                          SizedBox(width: 4),
                          Text("You: ${worker["lastRating"]}",
                              style: TextStyle(fontSize: 13)),
                          SizedBox(width: 10),
                          Icon(Icons.star_half, color: Colors.amber, size: 18),
                          SizedBox(width: 4),
                          Text("Overall: ${worker["overallRating"]}",
                              style: TextStyle(fontSize: 13)),
                        ],
                      ),
                      SizedBox(height: 4),
                      Text("Worked: ${worker["jobsDone"]} time(s)",
                          style: TextStyle(fontSize: 12)),
                    ],
                  ),
                ),
                ElevatedButton(
                  onPressed: () {
                    // Add rehire action
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.green,
                    padding: EdgeInsets.symmetric(horizontal: 10, vertical: 6),
                    minimumSize: Size(10, 36),
                  ),
                  child: Text("Rehire", style: TextStyle(fontSize: 15,color: Colors.black)),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
