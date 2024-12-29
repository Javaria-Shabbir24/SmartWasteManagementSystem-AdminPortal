import 'package:flutter/material.dart';
import 'admin_bottom_section.dart';

class AdminManageLeaveRequests extends StatefulWidget {
  const AdminManageLeaveRequests({super.key});

  @override
  State<AdminManageLeaveRequests> createState() => AdminManageLeaveRequestsState();
}

class AdminManageLeaveRequestsState extends State<AdminManageLeaveRequests> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar( 
        backgroundColor:const  Color(0xFFE6F3EC),
        title: const Text("Leave Requests",
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
              padding: const EdgeInsets.all(10),
              decoration: BoxDecoration(
                border: Border.all(color: const Color(0xFF2E7835),width: 9),
                borderRadius: BorderRadius.circular(10),
                color: Colors.white,
              ),
              child: const Text('Leaves pending approval are listed below for review and action',
              style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.bold,
            ),
            )
            ),
            const SizedBox(height: 15,),
            Container(
              padding: const EdgeInsets.only(left: 14,right: 14,top: 5,bottom: 5),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Container(
                    padding: const EdgeInsets.all(10),
                    margin: const EdgeInsets.all(10),
                    child: SingleChildScrollView(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                         
                      ),
                    ),
                  )
                ],
              )
            )
          ],
        ),
      ),
      //bottom navigation bar
      bottomNavigationBar: AdminBottomSection(),
    );
  }
}

//backend code
//defining a class for Employee details
class Employee{
  int employeeID=0;
  int employeeName=0;
  String requestType='';
  String summary='';
  String requestStatus='';// to maintain track of replied and unreplied leave requests
  String response='';//the response entered by admin
  //constructor
  Employee(int iD,int capacity, int fillLevel, String assignedTo, String location, int time)
  {
  }
}
