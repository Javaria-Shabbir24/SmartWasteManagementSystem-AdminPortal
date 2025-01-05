import 'package:flutter/material.dart';
import 'admin_bottom_section.dart';
import 'admin_leave_response.dart';
import 'admin_menu.dart';


class AdminManageLeaveRequests extends StatefulWidget {
  const AdminManageLeaveRequests({super.key});

  @override
  State<AdminManageLeaveRequests> createState() => AdminManageLeaveRequestsState();
}

class AdminManageLeaveRequestsState extends State<AdminManageLeaveRequests> {
  //dummy data
  List<EmployeeLeaveRequests> requests=[
    EmployeeLeaveRequests(1,'Mashal Pervaiz','Sick Leave Request','With due respect, I request you to grant me a leave for three days due to illness.'),
    EmployeeLeaveRequests(22,'Faisal Shehzad','Urgent Work Leave Request','I shall be unavailable due to an urgent piece of work at home. Kindly grant me leave for a day. Regards.'),
  ];
  Map<int, String> selectedOptions = {};

  void updateSelectedOption(int requestId, String value) {
    setState(() {
      selectedOptions[requestId] = value;
    });
  }

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
                    padding: const EdgeInsets.all(5),
                    margin: const EdgeInsets.all(10),
                    child: SingleChildScrollView(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          for(var request in requests)
                          Column(
                            children: [
                              leaveRequestCard(context, request,selectedOptions[request.employeeID] ?? 'Grant Request',
                                  (value) {
                                    updateSelectedOption(request.employeeID, value);
                                  },),
                              SizedBox(height: 20,),
                            ],
                          )
                        ],
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
//function to create leave requests cards
Widget leaveRequestCard(BuildContext context, EmployeeLeaveRequests request, String selectedOption, Function(String) updateSelectedOption){
  
  return Container(
    padding: EdgeInsets.all(10),
    decoration: BoxDecoration(
      border: Border.all(color: Colors.black,width: 3),
      borderRadius: BorderRadius.circular(10),
      color: Colors.white,
    ),
    child: Column(
      children: [
        Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  const Image(image: AssetImage('assets/leave.png'),
                  height: 50,
                  width: 60,),
                  const SizedBox(height: 10,),
                  
                ],

              ),
              SizedBox(width: 30,),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Text('Employee Id ${request.employeeID.toString()}',
                      style: const TextStyle(fontWeight: FontWeight.bold),),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Text(
                        request.employeeName
                      ),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Text(request.requestType),
                    ],
                  ),
                ],
              ),
            ],
          ),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                const Text('Summary: ',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
            SizedBox(height: 5,),
            Container(
              padding: EdgeInsets.all(5),
              decoration: BoxDecoration(
                border: Border.all(color: const Color(0xFF2E7835),width: 2),
                borderRadius: BorderRadius.circular(5),
              ),
              child: Text ('${request.leaveRequestSummary}',
            ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Radio<String>(
                      value: 'Grant Leave',
                      groupValue: selectedOption,
                      onChanged: (value) {
                        updateSelectedOption(value!);
                      },
                    ),
                    const Text('Grant Leave'),
                  ],
                ),
                SizedBox(width: 10,),
                Row(
                  children: [
                    Radio<String>(
                      value: 'Deny Request',
                      groupValue: selectedOption,
                      onChanged: (value) {
                        updateSelectedOption(value!);
                      },
                    ),
                    const Text('Deny Request'),
                  ],
                ),
              ],

            ),
             SizedBox(
              width: 130,
              height: 40,
              child: FloatingActionButton(onPressed: (){
                Navigator.push(context, MaterialPageRoute(builder: (context)=> AdminLeaveResponse(employeeID: request.employeeID,employeeName: request.employeeName, dateOfRequest: request.dateOfRequest )));

              },
              child: Text('Write a Response',
              style: TextStyle(color: Colors.white),
              ),
              backgroundColor: 
              Color(0xFF2E7835),
              ),
            )
      ],
    ),
    
  );
}

//backend code
//defining a class for Employee details
class EmployeeLeaveRequests{
  int employeeID=0;
  String employeeName='';
  String requestType='';
  String leaveRequestSummary='';
  DateTime dateOfRequest= DateTime.now(); //to track the date of leave requested
  String requestStatus='';// to maintain track of replied and unreplied leave requests
  String response='';//the response entered by admin
  //constructor
  EmployeeLeaveRequests(int iD,String name, String type, String summary)
  {
    employeeID=iD;
    employeeName=name;
    requestType=type;
    leaveRequestSummary=summary;
  }
}
