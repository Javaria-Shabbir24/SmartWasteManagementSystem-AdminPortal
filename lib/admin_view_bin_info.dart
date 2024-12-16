import 'dart:ffi';

import 'package:flutter/material.dart';
import 'admin_bottom_section.dart';

class AdminViewBinInfo extends StatefulWidget {
  const AdminViewBinInfo({super.key});

  @override
  State<AdminViewBinInfo> createState() => AdminViewBinInfoState();
}

class AdminViewBinInfoState extends State<AdminViewBinInfo> {
  //dummy data
  List<Area> areaList = [
    Area(1, 100, 75, 'None', 'Model Town', 15),
    Area(2, 500, 85, 'Iqbal Hussain', 'Iqbal Town', 5),
    Area(3, 100, 80, 'Shahid Aslam', 'Model Town', 25),
    Area(4, 500, 25, 'Imtiaz Muneer', 'Faisal Town', 13),
    Area(5, 100, 45, 'None', 'Model Town', 24),
    Area(6, 300, 15, 'None', 'Faisal Town', 25),
  ];
 
  //variable to store the selected Area 
  String? selectedArea;
  @override
  Widget build(BuildContext context) {
    //list of Area 
    List<String> area=['Model Town','Faisal Town','Iqbal Town'];
    return Scaffold(
      appBar: AppBar( 
        backgroundColor:const  Color(0xFFE6F3EC),
        title: const Text("View Bin Information",
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
              child: const Text('Bin Information is displayed below!',
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
                  //dropdown for selecting the area of registered bins
                  Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        const SizedBox(width: 20,),
                        const Text(
                          'Select Area:',
                          style: TextStyle(
                            color: Color(0xFF2E7835),
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        const SizedBox(width: 10,),
                        DropdownButton<String>(
                            hint: Text(selectedArea ?? 'Select'),
                            value: selectedArea,
                            items: area.map((String type){
                              return DropdownMenuItem(
                                value: type,
                                child: Text(type),
                              );
                            }).toList(),
                            onChanged:(String? newvalue){
                              setState(() {
                                selectedArea=newvalue;
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
                        children: areaList.where(
                          //filtering on the basis of dropdown selection
                          (area)=> 
                          area.binLocation==selectedArea || //if the Area is in the selected type
                          selectedArea==null || //if no filter selected
                          selectedArea=='Select'
                          ).map((area) {
                          return Column(
                            children: [
                              areaCard(context, area),
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
//frontend code for Area
Widget areaCard(BuildContext context, Area area){
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
            Image(image: AssetImage('assets/bin.jpg'),
            height: 50,
            width: 40,),
            SizedBox(height: 10,),
            Text('Bin Id ${area.binID.toString()}',
            style: TextStyle(fontWeight: FontWeight.bold),),
          ],

        ),
        SizedBox(width: 30,),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                const Text('Fill Level: ',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  
                  ),
                ),
                Text('${area.binFillLevel.toString()}%',
                style: TextStyle(
                  color: area.binFillLevel>= 80 ? Colors.red : Colors.black,
                ),),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                const Text('Capacity: ',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  ),
                ),
                Text('${area.binCapacity.toString()} L'),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                const Text('Assigned To: ',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  ),
                ),
                Text(area.binAssignedTo,
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                const Text('Location: ',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  ),
                ),
                Text(area.binLocation,
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                const Text('Collection Time: ',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  ),
                ),
                Text('${area.binExpectedCollectionTime.toString()}min',
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
//defining a class for Areas
class Area{
  int binID=0;
  int binFillLevel=0;
  int binCapacity=0;
  String binAssignedTo='';
  String binLocation='';
  int binExpectedCollectionTime=0;
  //constructor
  Area(int iD,int capacity, int fillLevel, String assignedTo, String location, int time)
  {
    binID=iD;
    binCapacity=capacity;
    binFillLevel=fillLevel;
    binAssignedTo=assignedTo;
    binLocation=location;
    binExpectedCollectionTime=time;
  }
}
