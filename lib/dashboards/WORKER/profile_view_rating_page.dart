import 'package:flutter/material.dart';

class ProfileViewRatingPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFF9F5EF),
      appBar: AppBar(
        backgroundColor: Colors.deepOrange,
        title: Text("Profile View & Rating"),
        centerTitle: true,
        elevation: 2,
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              padding: EdgeInsets.all(16),
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  colors: [Colors.deepOrange.shade100, Colors.orange.shade50],
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                ),
                borderRadius: BorderRadius.circular(20),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black12,
                    blurRadius: 8,
                    offset: Offset(0, 4),
                  ),
                ],
              ),
              child: Row(
                children: [
                  CircleAvatar(
                    radius: 35,
                    child: Icon(Icons.person, size: 35, color: Colors.white),
                    backgroundColor: Colors.deepOrange,
                  ),
                  SizedBox(width: 18),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text("Ramu Bhai",
                            style: TextStyle(
                                fontSize: 22,
                                fontWeight: FontWeight.bold,
                                color: Colors.black87)),
                        SizedBox(height: 4),
                        Text("Electrician",
                            style: TextStyle(fontSize: 16, color: Colors.grey[800])),
                        SizedBox(height: 4),
                        Text("Location: Agra",
                            style: TextStyle(fontSize: 14, color: Colors.grey[600])),
                        SizedBox(height: 8),
                        Row(
                          children: [
                            Icon(Icons.star, color: Colors.amber, size: 20),
                            Icon(Icons.star, color: Colors.amber, size: 20),
                            Icon(Icons.star, color: Colors.amber, size: 20),
                            Icon(Icons.star_half, color: Colors.amber, size: 20),
                            Icon(Icons.star_border, color: Colors.amber, size: 20),
                            SizedBox(width: 8),
                            Text("3.5",
                                style: TextStyle(
                                    fontSize: 16, fontWeight: FontWeight.w600)),
                          ],
                        ),
                      ],
                    ),
                  ),
                  Icon(Icons.verified, color: Colors.green, size: 28),
                ],
              ),
            ),
            SizedBox(height: 30),
            Text("Ratings & Reviews",
                style: TextStyle(
                    fontSize: 20, fontWeight: FontWeight.bold, color: Colors.black87)),
            SizedBox(height: 10),
            ReviewCard(
              name: "Ajay Kumar",
              profession: "Plumber",
              rating: 4.5,
              review: "Very punctual and hardworking. Highly recommended!",
              icon: Icons.handyman,
              timeAgo: "2 days ago",
            ),
            ReviewCard(
              name: "Pooja Sharma",
              profession: "Painter",
              rating: 4.0,
              review: "Good work, but came a bit late.",
              icon: Icons.format_paint,
              timeAgo: "5 days ago",
            ),
            ReviewCard(
              name: "Manish Verma",
              profession: "Welder",
              rating: 5.0,
              review: "Excellent service and polite behavior.",
              icon: Icons.build_circle,
              timeAgo: "1 week ago",
            ),
          ],
        ),
      ),
    );
  }
}

class ReviewCard extends StatelessWidget {
  final String name;
  final String profession;
  final double rating;
  final String review;
  final IconData icon;
  final String timeAgo;

  const ReviewCard({
    required this.name,
    required this.profession,
    required this.rating,
    required this.review,
    required this.icon,
    required this.timeAgo,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(bottom: 18),
      padding: EdgeInsets.all(16),
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [Colors.orange.shade100, Colors.orange.shade50],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
        borderRadius: BorderRadius.circular(18),
        boxShadow: [
          BoxShadow(
            color: Colors.black12,
            blurRadius: 6,
            offset: Offset(0, 3),
          ),
        ],
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          CircleAvatar(
            backgroundColor: Colors.deepOrange,
            radius: 30,
            child: Icon(icon, size: 26, color: Colors.white),
          ),
          SizedBox(width: 14),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(name,
                            style: TextStyle(
                                fontSize: 17, fontWeight: FontWeight.bold)),
                        Text(profession,
                            style: TextStyle(
                                fontSize: 14,
                                color: Colors.grey[700],
                                fontStyle: FontStyle.italic)),
                      ],
                    ),
                    Text(timeAgo,
                        style: TextStyle(
                            fontSize: 12,
                            color: Colors.grey[600],
                            fontStyle: FontStyle.italic)),
                  ],
                ),
                SizedBox(height: 6),
                Row(
                  children: [
                    Icon(Icons.star, color: Colors.amber, size: 20),
                    SizedBox(width: 4),
                    Text(rating.toString(),
                        style: TextStyle(
                            fontSize: 15, fontWeight: FontWeight.w500)),
                  ],
                ),
                SizedBox(height: 6),
                Text(review,
                    style: TextStyle(color: Colors.black87, fontSize: 15)),
              ],
            ),
          )
        ],
      ),
    );
  }
}
