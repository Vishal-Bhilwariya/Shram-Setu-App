import 'package:flutter/material.dart';

class WorkerProfilePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF5F5F5),
      appBar: AppBar(
        backgroundColor: const Color(0xFFFF6F00),
        elevation: 0,
        title: const Text("My Profile"),
        centerTitle: true,
      ),
      body: Column(
        children: [
          Container(
            width: double.infinity,
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 24),
            decoration: const BoxDecoration(
              gradient: LinearGradient(
                colors: [Color(0xFFFF9800), Color(0xFFFFC107)],
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
              ),
              borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(30),
                  bottomRight: Radius.circular(30)),
            ),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const CircleAvatar(
                  radius: 40,
                  // backgroundImage: AssetImage("assets/images/profile.jpg"),
                  child: Icon(Icons.add_a_photo),
                ),
                const SizedBox(width: 16),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: const [
                      Text("Ramu Bhai",
                          style: TextStyle(
                              fontSize: 22,
                              fontWeight: FontWeight.bold,
                              color: Colors.white)),
                      SizedBox(height: 4),
                      Text("Electrician",
                          style:
                          TextStyle(fontSize: 16, color: Colors.white70)),
                    ],
                  ),
                )
              ],
            ),
          ),

          const SizedBox(height: 10),
          TextButton.icon(
            onPressed: () {
              // Implement photo picker here
            },
            icon: const Icon(Icons.camera_alt, color: Color(0xFFFF6F00)),
            label: const Text("Change Profile Photo",
                style: TextStyle(
                    color: Color(0xFFFF6F00), fontWeight: FontWeight.w600)),
          ),

          const SizedBox(height: 10),
          _buildInfoTile(Icons.location_on, "Location", "Agra"),
          _buildInfoTile(Icons.attach_money, "Fees", "₹500/day"),
          _buildInfoTile(Icons.description, "About",
              "Experienced electrician with 5+ years of work in households and shops."),
          const Spacer(),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: ElevatedButton.icon(
              onPressed: () {
                Navigator.pushNamed(context, '/worker_profile');
              },
              icon: const Icon(Icons.edit),
              label: const Text("Edit Profile"),
              style: ElevatedButton.styleFrom(
                backgroundColor: const Color(0xFFFF6F00),
                padding:
                const EdgeInsets.symmetric(horizontal: 30, vertical: 12),
                textStyle: const TextStyle(fontSize: 16),
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10)),
              ),
            ),
          )
        ],
      ),
    );
  }

  Widget _buildInfoTile(IconData icon, String title, String data) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
      child: Card(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
        elevation: 3,
        child: ListTile(
          leading: Icon(icon, color: Color(0xFFFF6F00)),
          title: Text(title,
              style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 16)),
          subtitle: Text(data,
              style: const TextStyle(fontSize: 15, color: Colors.black87)),
        ),
      ),
    );
  }
}
