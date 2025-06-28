import 'package:flutter/material.dart';

class RatingsDetailPage extends StatelessWidget {
  final List<Map<String, dynamic>> reviews = [
    {
      'name': "Kunal",
      'rating': 4.5,
      'review': "Very punctual and hardworking. Highly recommended!",
      'icon': Icons.account_circle,
      'timeAgo': "2 days ago"
    },
    {
      'name': "Gopal",
      'rating': 4.0,
      'review': "Good work, but came a bit late.",
      'icon': Icons.account_circle,
      'timeAgo': "5 days ago"
    },
    {
      'name': "Bhupendra",
      'rating': 5.0,
      'review': "Excellent service and polite behavior.",
      'icon': Icons.account_circle,
      'timeAgo': "1 week ago"
    }
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Your Ratings"),
        backgroundColor: Colors.deepOrange,
      ),
      body: ListView.builder(
        padding: EdgeInsets.all(16),
        itemCount: reviews.length,
        itemBuilder: (context, index) {
          final review = reviews[index];
          return Card(
            margin: EdgeInsets.only(bottom: 16),
            child: ListTile(
              leading: CircleAvatar(
                backgroundColor: Colors.deepOrange,
                child: Icon(review['icon'],size: 40, color: Colors.white),
              ),
              title: Text(review['name']),
              subtitle: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Icon(Icons.star, color: Colors.amber, size: 18),
                      Text(" ${review['rating']}",
                          style: TextStyle(fontWeight: FontWeight.bold)),
                    ],
                  ),
                  SizedBox(height: 4),
                  Text(review['review']),
                  SizedBox(height: 2),
                  Text(
                    review['timeAgo'],
                    style: TextStyle(fontSize: 12, color: Colors.grey),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
