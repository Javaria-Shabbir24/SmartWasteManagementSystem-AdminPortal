import 'package:flutter/material.dart';
import 'package:smart_waste_management_system/admin_profile.dart';
import 'admin.dart';
import 'admin_about.dart';

class AdminMenu extends StatelessWidget {
  const AdminMenu({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        children: [
          const UserAccountsDrawerHeader(
            accountName: Text('Javaria Shabbir'), 
            accountEmail: Text('Admin'),
            currentAccountPicture: CircleAvatar(
              child: ClipOval(
                child: Image(
                  image: AssetImage('assets/linda.jpg'),
                  fit: BoxFit.cover,
                  ),
                ),
              ),
              decoration: BoxDecoration(
                color: Color(0xFF2E7835),
              ),
            ),
            ListTile(
              leading: const Icon(Icons.home),
              title: const Text('Home'),
              onTap: () => Navigator.push(
                context,
                MaterialPageRoute(builder: (context)=>Admin()),
              ),
            ),
            ListTile(
              leading: const Icon(Icons.person),
              title: const Text('My Profile'),
              onTap: () => Navigator.push(
                context,
                MaterialPageRoute(builder: (context)=> AdminProfile()),
              ),
            ),
            ListTile(
              leading: const Icon(Icons.info),
              title: const Text('About'),
              onTap: () => Navigator.push(
                context,
                MaterialPageRoute(builder: (context)=>AdminAbout()),
              ),
            ),
            ListTile(
              leading: const Icon(Icons.logout),
              title: const Text('Logout'),
              onTap: () => null,
            ),
        ],
      ),
    );
  }
}