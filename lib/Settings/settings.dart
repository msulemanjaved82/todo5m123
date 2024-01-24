import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Settings'),
        ),

        body: SettingsScreen(),
      ),
    );
  }
}

class SettingsScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            'Settings',
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
          ),
          const SizedBox(height: 8),
          const Text('Account', style: TextStyle(fontSize: 16)),
          buildSettingItem(context, 'Profile'),
          buildSettingItem(context, 'Password'),
          buildSettingItem(context, 'Notifications'),
          const SizedBox(height: 16),
          const Text('More', style: TextStyle(fontSize: 16)),
          buildSettingItem(context, 'Rate & Review'),
          buildSettingItem(context, 'Help'),
          const SizedBox(height: 16),
          ElevatedButton(
            onPressed: () => showLogoutDialog(context),
            child: const Text('Logout'),
          ),
        ],
      ),
    );
  }

  Widget buildSettingItem(BuildContext context, String title) {
    return ListTile(
      title: Text(title),
      onTap: () {
        // Handle tap for each setting item
        showDialog(
          context: context,
          builder: (BuildContext context) {
            return AlertDialog(
              title: Text(title),
              content: Text('This is the $title setting.'),
              actions: [
                TextButton(
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                  child: const Text('Close'),
                ),
              ],
            );
          },
        );
      },
    );
  }

  void showLogoutDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Logout'),
          content: const Text('Are you sure you want to logout?'),
          actions: [
            TextButton(
              onPressed: () {
                // Implement logout logic here
                Navigator.of(context).pop();
              },
              child: const Text('Yes'),
            ),
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: const Text('No'),
            ),
          ],
        );
      },
    );
  }
}
