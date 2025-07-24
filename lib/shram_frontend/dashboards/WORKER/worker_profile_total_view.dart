// ---------- Detail Page 1: Profile Views ----------
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ProfileViewsDetailPage extends StatelessWidget {
  final List<String> viewers = [
    "Lakhan",
    "Kapil",
    "Prince",
    "Harsh"
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Profile Views"),
        backgroundColor: Colors.deepOrange,
      ),
      body: ListView.builder(
        padding: EdgeInsets.all(16),
        itemCount: viewers.length,
        itemBuilder: (context, index) {
          return Card(
            margin: EdgeInsets.symmetric(vertical: 6),
            child: ListTile(
              leading: Icon(Icons.person, color: Colors.deepOrange),
              title: Text(viewers[index]),
              subtitle: Text("Viewed your profile"),
            ),
          );
        },
      ),
    );
  }
}