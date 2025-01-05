import 'package:flutter/material.dart';
import 'admin_bottom_section.dart';
import 'package:intl/intl.dart';
import 'admin_menu.dart';

class AdminLeaveResponse extends StatelessWidget {
  final int employeeID;
  final String employeeName;
  final DateTime dateOfRequest;
  const AdminLeaveResponse({super.key, required this.employeeID, required this.employeeName ,required this.dateOfRequest});
  

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
      ),
      endDrawer:AdminMenu(),
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
                  Image(image: AssetImage('assets/reply.jpg')),
                  SizedBox(height: 20,),
                  Row(
                    children: [
                     Text('To, Employee ID: ${employeeID}', style: TextStyle(fontSize: 18),)
                    ],
                  ),
                  SizedBox(height: 20,),
                  Row(
                    children: [
                     Text('Response:', style: TextStyle(fontSize: 18),)
                    ],
                  ),
                  SizedBox(height: 20,),
                  TextField(
                    decoration: InputDecoration(
                      
                      hintText: 'write here...',
                      fillColor: Colors.white,
                      filled: true,
                      contentPadding: EdgeInsets.symmetric(vertical: 30,horizontal: 20),
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                        borderSide: BorderSide(
                          color: Colors.black,
                          width: 2,

                        )
                      )
                    ),
                  ),
                  SizedBox(height: 20,),
                  Row(
                    children: [
                     Text('Contact Person:', style: TextStyle(fontSize: 18),),
                     SizedBox(width: 10,),
                     Text(employeeName, style: TextStyle(fontSize: 18),),
                    ],
                  ),
                  SizedBox(height: 20,),
                  Row(
                    children: [
                     Text('Date:', style: TextStyle(fontSize: 18),),
                     SizedBox(width: 10,),
                     Text(DateFormat('dd-MM-yyyy ').format(dateOfRequest), style: TextStyle(fontSize: 18),),
                    ],
                  ),
                  SizedBox(height: 20,),
                  Row(
                    children: [
                      SizedBox(width: 240,),
                      SizedBox(
                        width: 80,
                        height: 40,
                        child: FloatingActionButton(onPressed: null,
                        child: Text('Send',style: TextStyle(color: Colors.white),),
                        backgroundColor: Color(0xFF2E7835),),
                      ),
                      
                    ],
                  )
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