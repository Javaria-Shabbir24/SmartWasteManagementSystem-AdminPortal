import 'package:flutter/material.dart';
import 'admin_bottom_section.dart';

class AdminManageStaff extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor:const  Color(0xFFE6F3EC),
        title: const Text("Manage Staff",
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
      //setting the background color
      backgroundColor:const  Color(0xFFE6F3EC),
      //setting up the body section
      body: SingleChildScrollView(
        child: Column(
          //column elements
          children: [
            //Divider for better User Interface
            const Divider(
              color: Colors.black,
              thickness: 1,
            ),
            Container(
              margin: const EdgeInsets.all(18),
              padding: const EdgeInsets.all(10),
              decoration: BoxDecoration(
                color: const Color(0xFF2E7835),
                borderRadius: BorderRadius.circular(10),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  card(),
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
// returning a card showing the statistics
Widget statCard(int count, String label){
  return Card(
    
  );
}