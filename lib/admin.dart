import 'package:flutter/material.dart';

class Admin extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xFFE6F3EC),
        title: Text('Admin Home', 
        style: TextStyle(
          color: Colors.black,
          fontWeight: FontWeight.bold,
        ),
        ),
        actions: [
          IconButton(onPressed: null, 
          icon: Icon(Icons.menu,
          color: Colors.black,))
        ],
      ),
      body: Center(
        child: Text(
          'Welcome to the Admin Page!',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
