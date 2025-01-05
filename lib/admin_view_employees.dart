import 'package:flutter/material.dart';
import 'admin_bottom_section.dart';
import 'admin_menu.dart';

class AdminViewEmployees extends StatefulWidget {
  const AdminViewEmployees({super.key});

  @override
  State<AdminViewEmployees> createState() => AdminViewEmployeesState();
}

class AdminViewEmployeesState extends State<AdminViewEmployees> {
  //dummy data
  List<Employee> employeeList = [
    Employee(1, 'Ali Anas', 'alianas@gmail.com', 'Yes',03345567223),
    Employee(2, 'Javad Ali', 'javedali@gmail.com', 'Yes',03345566666),
    Employee(3, 'Afzal Amir', 'afzal1@gmail.com', 'No',033324456112),
    Employee(4, 'Omar Anas', 'omar@gmail.com', 'No',03004474553),
  ];
 
  //variable to store the selected employee 
  String? selectedLeaveStatus;
  @override
  Widget build(BuildContext context) {
    //list of employee 
    List<String> employee=['Yes','No'];
    return Scaffold(
      appBar: AppBar( 
        backgroundColor:const  Color(0xFFE6F3EC),
        title: const Text("Employees",
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
              child: const Text('The details of registered employees are shown below.',
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
                  //dropdown for selecting the leave status
                  Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        const SizedBox(width: 20,),
                        const Text(
                          'Select On Leave Status:',
                          style: TextStyle(
                            color: Color(0xFF2E7835),
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        const SizedBox(width: 10,),
                        DropdownButton<String>(
                            hint: Text(selectedLeaveStatus ?? 'Select'),
                            value: selectedLeaveStatus,
                            items: employee.map((String type){
                              return DropdownMenuItem(
                                value: type,
                                child: Text(type),
                              );
                            }).toList(),
                            onChanged:(String? newvalue){
                              setState(() {
                                selectedLeaveStatus=newvalue;
                              }
                              );
                            },
                            dropdownColor: Colors.white,
                        ),
                      ],
                  ),
                  Container(
                    padding: const EdgeInsets.all(10),
                    margin: const EdgeInsets.all(10),
                    child: SingleChildScrollView(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: employeeList.where(
                          //filtering on the basis of dropdown selection
                          (employee)=> 
                          employee.employeeLeaveStatus==selectedLeaveStatus || //if the employee is in the selected type
                          selectedLeaveStatus==null || //if no filter selected
                          selectedLeaveStatus=='Select'
                          ).map((employee) {
                          return Column(
                            children: [
                              employeeCard(context, employee),
                              const SizedBox(height: 20),
                            ],
                          );
                        }).toList(),
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
//frontend code for employee
Widget employeeCard(BuildContext context, Employee employee){
  return Container(
    padding: const EdgeInsets.all(10),
    decoration: BoxDecoration(
      border: Border.all(color: Colors.black,width: 3),
      borderRadius: BorderRadius.circular(10),
      color: Colors.white,
    ),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            const Image(image: AssetImage('assets/employee.jpg'),
            height: 50,
            width: 40,),
            const SizedBox(height: 10,),
            Text('Id ${employee.employeeID.toString()}',
            style: const TextStyle(fontWeight: FontWeight.bold),),
          ],

        ),
        const SizedBox(width: 30,),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                const Text('Name: ',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  
                  ),
                ),
                Text(employee.employeeName,
                ),
                const SizedBox(width: 45,),
                GestureDetector(
                  onTap: () {
                    deleteEmployee(context,employee); 
                  },
                  child: Icon(
                     Icons.delete,
                  ),
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                const Text('Email: ',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  ),
                ),
                Text(employee.employeeEmail, style: const TextStyle(fontSize: 14),),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                const Text('Contact: ',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  ),
                ),
                Text(employee.employeeContactNumber.toString(),
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                const Text('On Leave: ',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  ),
                ),
                Text(employee.employeeLeaveStatus,
                style: TextStyle(
                  color: employee.employeeLeaveStatus == 'Yes' ? Colors.red : Colors.black,
                ),
                ),
              ],
            ),
          ],
        ),
        
      ],

    )
    
  );
}
//backend code
//defining a class for employees
class Employee{
  int employeeID=0;
  String employeeName='';
  String employeeEmail='';
  String employeeLeaveStatus='';
  int employeeContactNumber=0;
  //constructor
  Employee(int iD,String name, String email, String leaveStatus, int contactNumber)
  {
    employeeID=iD;
    employeeName=name;
    employeeEmail=email;
    employeeLeaveStatus=leaveStatus;
    employeeContactNumber=contactNumber;
  }
}

//method to delete details of an employee
void deleteEmployee(BuildContext context, Employee employee){
  showDialog(
  context: context,
  builder: (BuildContext context){
    return AlertDialog(
      content: 
      Container(
        height: 180,
        child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(height: 20,),
          const Text('Are you sure you want to remove this employee?',
          style: TextStyle(fontSize: 20,
          ),),
          const SizedBox(height: 20,),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
                  SizedBox(width: 100,
                  child:FloatingActionButton(onPressed: (){
                    Navigator.pop(context);
                    }, 
                  backgroundColor: Colors.white,
                  child: const Text('Cancel', 
                    style: TextStyle(color: Colors.black,)
                    ),
                ),
              ),
              const SizedBox(width: 100,
                  child:FloatingActionButton(onPressed: null, 
                  backgroundColor: Color.fromARGB(255, 133, 23, 15),
                  child: Text('Delete', 
                    style: TextStyle(color: Colors.white,)
                    ),
                ),
              ),
            ],
          ),
        ],
      ),
      ),
    );
  }
  );
}
