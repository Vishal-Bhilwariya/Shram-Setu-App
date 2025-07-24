import 'package:flutter/material.dart';

class WorkerMorePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("More"),
        backgroundColor: Color(0xFFFF6F00),
      ),
      body: ListView(
        padding: EdgeInsets.all(16),
        children: [
          _buildTile(
            icon: Icons.settings,
            title: 'Settings',
            subtitle: 'Manage app preferences',
            onTap: () {
              _showComingSoonDialog(context);
            },
          ),
          Divider(),

          _buildTile(
            icon: Icons.info_outline,
            title: 'About App',
            subtitle: 'Know more about Shram Setu',
            onTap: () {
              _showComingSoonDialog(context);
            },
          ),
          Divider(),

          _buildTile(
            icon: Icons.help_outline,
            title: 'Help & Support',
            subtitle: 'Get assistance',
            onTap: () {
              _showComingSoonDialog(context);
            },
          ),
          Divider(),

          _buildTile(
            icon: Icons.feedback,
            title: 'Give Feedback',
            subtitle: 'Tell us what you think',
            onTap: () {
              _showComingSoonDialog(context);
            },
          ),
          Divider(),

          _buildTile(
            icon: Icons.logout,
            title: 'Logout',
            subtitle: 'Sign out of your account',
            onTap: () {
              _showLogoutDialog(context);
            },
          ),
        ],
      ),
    );
  }

  Widget _buildTile({
    required IconData icon,
    required String title,
    required String subtitle,
    required VoidCallback onTap,
  }) {
    return ListTile(
      leading: Icon(icon, color: Color(0xFFFF6F00)),
      title: Text(title,
          style: TextStyle(fontWeight: FontWeight.w600, fontSize: 16)),
      subtitle: Text(subtitle),
      trailing: Icon(Icons.arrow_forward_ios, size: 16),
      onTap: onTap,
    );
  }

  void _showComingSoonDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Text("Coming Soon"),
        content: Text("This feature will be updated soon."),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: Text("OK"),
          ),
        ],
      ),
    );
  }

  void _showLogoutDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Text("Logout"),
        content: Text("Are you sure you want to logout?"),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: Text("Cancel"),
          ),
          ElevatedButton(
            onPressed: () {
              Navigator.pop(context);
              Navigator.pushReplacementNamed(context, '/login');
            },
            style: ElevatedButton.styleFrom(
              backgroundColor: Color(0xFFFF6F00),
            ),
            child: Text("Logout"),
          ),
        ],
      ),
    );
  }
}

// import 'package:flutter/material.dart';
//
// class WorkerMorePage extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text("More"),
//         backgroundColor: Color(0xFFFF6F00),
//       ),
//       body: ListView(
//         padding: EdgeInsets.all(16),
//         children: [
//           _buildTile(
//             icon: Icons.settings,
//             title: 'Settings',
//             subtitle: 'Manage app preferences',
//             onTap: () {
//               // Add settings navigation
//             },
//           ),
//           Divider(),
//
//           _buildTile(
//             icon: Icons.info_outline,
//             title: 'About App',
//             subtitle: 'Know more about Shram Setu',
//             onTap: () {
//               // Navigate to about page
//             },
//           ),
//           Divider(),
//
//           _buildTile(
//             icon: Icons.help_outline,
//             title: 'Help & Support',
//             subtitle: 'Get assistance',
//             onTap: () {
//               // Navigate to help section
//             },
//           ),
//           Divider(),
//
//           _buildTile(
//             icon: Icons.feedback,
//             title: 'Give Feedback',
//             subtitle: 'Tell us what you think',
//             onTap: () {
//               // Feedback action
//             },
//           ),
//           Divider(),
//
//           _buildTile(
//             icon: Icons.logout,
//             title: 'Logout',
//             subtitle: 'Sign out of your account',
//             onTap: () {
//               _showLogoutDialog(context);
//             },
//           ),
//         ],
//       ),
//     );
//   }
//
//   Widget _buildTile({
//     required IconData icon,
//     required String title,
//     required String subtitle,
//     required VoidCallback onTap,
//   }) {
//     return ListTile(
//       leading: Icon(icon, color: Color(0xFFFF6F00)),
//       title: Text(title,
//           style: TextStyle(fontWeight: FontWeight.w600, fontSize: 16)),
//       subtitle: Text(subtitle),
//       trailing: Icon(Icons.arrow_forward_ios, size: 16),
//       onTap: onTap,
//     );
//   }
//
//   void _showLogoutDialog(BuildContext context) {
//     showDialog(
//       context: context,
//       builder: (context) => AlertDialog(
//         title: Text("Logout"),
//         content: Text("Are you sure you want to logout?"),
//         actions: [
//           TextButton(
//             onPressed: () => Navigator.pop(context),
//             child: Text("Cancel"),
//           ),
//           ElevatedButton(
//             onPressed: () {
//               Navigator.pop(context);
//               Navigator.pushReplacementNamed(context, '/login');
//             },
//             style: ElevatedButton.styleFrom(
//               backgroundColor: Color(0xFFFF6F00),
//             ),
//             child: Text("Logout"),
//           ),
//         ],
//       ),
//     );
//   }
// }
