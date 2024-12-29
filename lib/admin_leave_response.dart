import 'package:flutter/material.dart';
import 'admin_bottom_section.dart';

class AdminLeaveResponse extends StatelessWidget {
  const AdminLeaveResponse({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar( 
        backgroundColor:const  Color(0xFFE6F3EC),
        title: const Text("Leave Response",
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
      
      backgroundColor: const Color(0xFFE6F3EC),
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            const Divider(
              color: Colors.black,
              thickness: 1,
            ),
            Container(
              padding: EdgeInsets.all(10),
              margin: EdgeInsets.all(10),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Image(image: AssetImage('assets/reply.jpg'))
                ],

              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: AdminBottomSection(),
    );
  }
}