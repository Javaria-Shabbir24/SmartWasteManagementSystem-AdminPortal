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
              margin: const EdgeInsets.all(19),
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: const Color(0xFF2E7835),
                borderRadius: BorderRadius.circular(10),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  //card showing the registered employees
                  statCard(10,"  Employees  "),
                  //card showing the pending hiring requests
                  statCard(10,"Hire Requests"),
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
    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
    color: const Color(0xFFB7EFBD),
    child: Padding(
      padding: const EdgeInsets.all(10),
      child: Column(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        //printing the count
        Text(count.toString(),
        textAlign: TextAlign.left,
        style: const TextStyle(
          fontSize: 22,
          fontWeight: FontWeight.bold,
          color:  Color(0xFF2E7835),
        ),
        ),
        const SizedBox(height: 10),
        //printing the label
        Text(label,
        style: const TextStyle(
          fontWeight: FontWeight.w600,
        ),
        ),
      ],
    ),
    
    ),
  );
}