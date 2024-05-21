import 'package:flutter/material.dart';



class FacebookSettingsApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: SettingsPage(),
    );
  }
}

class SettingsPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title:const Text('Settings'),

          actions:  <Widget>[
          IconButton(
            icon:  const Icon(Icons.search),
            onPressed: () {
              // Add your search functionality here
            },
          ),]
              ),
      body: ListView(
        children: [
          SettingsSection(
            title: 'Account Settings',
            items: [
              SettingsItem(
                icon: Icons.person,
                title: 'Personal Information',
                onTap: () {},
              ),
              SettingsItem(
                icon: Icons.lock,
                title: 'Password and Security',
                onTap: () {},
              ),
              SettingsItem(
                icon: Icons.notifications,
                title: 'Notifications',
                onTap: () {},
              ),
            ],
          ),
          SettingsSection(
            title: 'Privacy Settings',
            items: [
              SettingsItem(
                icon: Icons.privacy_tip,
                title: 'Privacy Checkup',
                onTap: () {},
              ),
              SettingsItem(
                icon: Icons.shield,
                title: 'Privacy Shortcuts',
                onTap: () {},
              ),
              SettingsItem(
                icon: Icons.block,
                title: 'Blocking',
                onTap: () {},
              ),
            ],
          ),
          SettingsSection(
            title: 'Help & Support',
            items: [
              SettingsItem(
                icon: Icons.help,
                title: 'Help Center',
                onTap: () {},
              ),
              SettingsItem(
                icon: Icons.contact_support,
                title: 'Support Inbox',
                onTap: () {},
              ),
              SettingsItem(
                icon: Icons.feedback,
                title: 'Report a Problem',
                onTap: () {},
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class SettingsSection extends StatelessWidget {
  final String title;
  final List<SettingsItem> items;

  SettingsSection({required this.title, required this.items});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.all(16.0),
          child: Text(
            title,
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          ),
        ),
        Column(children: items),
        Divider(),
      ],
    );
  }
}

class SettingsItem extends StatelessWidget {
  final IconData icon;
  final String title;
  final VoidCallback onTap;

  SettingsItem({required this.icon, required this.title, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Icon(icon, color: Colors.blue[800]),
      title: Text(title),
      trailing: Icon(Icons.arrow_forward_ios, size: 16.0),
      onTap: onTap,
    );
  }
}
