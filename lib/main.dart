import 'package:flutter/material.dart';
import 'admin.dart'; // Import the admin page

void main() {
  runApp(Home());
}

class Home extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Smart Waste Management System',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: HomePage(),
    );
  }
}

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Home Page'),
      ),
      body: Center(
        child: ElevatedButton(
          onPressed: () {
            // Navigate to Admin Page
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => Admin()),
            );
          },
          child: Text('Go to Admin Page'),
        ),
      ),
    );
  }
}
