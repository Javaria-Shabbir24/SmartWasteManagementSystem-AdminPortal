import 'package:flutter/material.dart';
import 'admin_bottom_section.dart';
import 'admin_profile_section.dart';
import 'admin_grid_section.dart';

class Admin extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor:const  Color(0xFFE6F3EC),
        title: const Text('Admin Home', 
        style: TextStyle(
          color: Colors.black,
          fontWeight: FontWeight.bold,
        ),
        ),
        actions: const [
          IconButton(onPressed: null, 
          icon: Icon(Icons.menu,
          color: Colors.black,))
        ],
      ),
      backgroundColor:const  Color(0xFFE6F3EC),
      body: SingleChildScrollView(
        child: Column(
          children: [
            //Divider for better UI
            Divider( 
              color: Colors.black, 
              thickness: 1, 
            ),
          adminprofilesection(), // profile section called 
          AdminGridSection(),
          
          ],
        ),
      ),
      bottomNavigationBar: AdminBottomSection(),
    );
  }
}
