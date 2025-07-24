// ---------- Detail Page 2: Ratings ----------
import 'package:flutter/material.dart';

class ProfileViewRatingPage extends StatelessWidget {
  final int totalViews = 12;
  final double overallRating = 4.3;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFF9F5EF),
      appBar: AppBar(
        backgroundColor: Colors.deepOrange,
        title: Text("Insights"),
        centerTitle: true,
        elevation: 2,
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Top two clickable cards
            Row(
              children: [
                _buildInsightCard(
                  context,
                  title: 'Profile Views',
                  value: '$totalViews',
                  icon: Icons.remove_red_eye,
                  onTap: () {
                    Navigator.pushNamed(context, '/total_worker_view');
                  },
                ),
                SizedBox(width: 12),
                _buildInsightCard(
                  context,
                  title: 'Overall Rating',
                  value: '$overallRating / 5',
                  icon: Icons.star_rate,
                  onTap: () {
                    Navigator.pushNamed(context, '/rating');
                  },
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildInsightCard(BuildContext context,
      {required String title,
        required String value,
        required IconData icon,
        required VoidCallback onTap}) {
    return Expanded(
      child: InkWell(
        onTap: onTap,
        child: Container(
          padding: EdgeInsets.all(16),
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: [Colors.orange.shade100, Colors.orange.shade50],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            ),
            borderRadius: BorderRadius.circular(16),
            boxShadow: [
              BoxShadow(
                color: Colors.black12,
                blurRadius: 6,
                offset: Offset(0, 3),
              ),
            ],
          ),
          child: Column(
            children: [
              Icon(icon, size: 32, color: Colors.deepOrange),
              SizedBox(height: 8),
              Text(value,
                  style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: Colors.black87)),
              SizedBox(height: 4),
              Text(title,
                  style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.w500,
                      color: Colors.grey[800])),
            ],
          ),
        ),
      ),
    );
  }
}