import 'package:flutter/material.dart';
import 'admin_bottom_section.dart';
import 'admin_profile_section.dart';
import 'admin_grid_section.dart';
import 'admin_menu.dart';

class Admin extends StatefulWidget {
  @override
  State<Admin> createState() => _AdminState();
}
class _AdminState extends State<Admin> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xFFE6F3EC),
        title: const Text(
          'Admin Home',
          style: TextStyle(
            color: Colors.black,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      endDrawer: AdminMenu(),
      backgroundColor: const Color(0xFFE6F3EC),
      body: SingleChildScrollView(
        child: Column(
          children: [
            const Divider(
              color: Colors.black,
              thickness: 1,
            ),
            adminprofilesection(), // Profile section called
            AdminGridSection(),
          ],
        ),
      ),
      bottomNavigationBar: AdminBottomSection(),
    );
  }
}
