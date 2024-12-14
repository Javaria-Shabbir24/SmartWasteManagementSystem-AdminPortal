import 'package:flutter/material.dart';

class AdminViewEmployees extends StatelessWidget {
  const AdminViewEmployees({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('View Employees',
        style: TextStyle(fontWeight: FontWeight.bold),),
      ),

    );
  }
}