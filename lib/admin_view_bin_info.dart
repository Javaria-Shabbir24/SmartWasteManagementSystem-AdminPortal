import 'package:flutter/material.dart';
import 'admin_bottom_section.dart';

class AdminViewBinInfo extends StatelessWidget {
  const AdminViewBinInfo({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar( 
        backgroundColor:const  Color(0xFFE6F3EC),
        title: const Text("Bin Information",
        style: TextStyle(
          color: Colors.black,
          fontWeight: FontWeight.bold,
         ),
        ),
        actions: const [
          IconButton(
            onPressed: null, 
            icon: Icon(Icons.menu,
            color: Colors.black,
            )
            )
        ],
      ),
      bottomNavigationBar: AdminBottomSection(),
    );
  }
}