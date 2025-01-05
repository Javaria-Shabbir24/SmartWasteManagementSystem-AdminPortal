import 'package:flutter/material.dart';
import 'admin_bottom_section.dart';
import 'admin_menu.dart';

class AdminViewVehicles extends StatefulWidget {
  const AdminViewVehicles({super.key});

  @override
  State<AdminViewVehicles> createState() => AdminViewVehiclesState();
}

class AdminViewVehiclesState extends State<AdminViewVehicles> {
  //dummy data
  List<Vehicle> vehicleList = [
    Vehicle(1, 'Roll Off Truck', '2500L', 'Diesel'),
    Vehicle(2, 'Front Loader Truck', '5000L', 'Diesel'),
    Vehicle(3, 'Front Loader Truck', '5000L', 'Diesel'),
    Vehicle(4, 'Front Loader Truck', '5000L', 'Petrol'),
  ];
 
  //variable to store the selected vehicle 
  String? selectedTruckType;
  @override
  Widget build(BuildContext context) {
    //list of vehicle 
    List<String> vehicle=['Roll Off Truck','Front Loader Truck'];
    return Scaffold(
      appBar: AppBar( 
        backgroundColor:const  Color(0xFFE6F3EC),
        title: const Text("vehicles",
        style: TextStyle(
          color: Colors.black,
          fontWeight: FontWeight.bold,
         ),
        ),
      ),
      endDrawer: AdminMenu(),
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
              child: const Text('The details of registered vehicles are shown below.',
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
                        const SizedBox(width: 16,),
                        const Text(
                          'Select Vehicle:',
                          style: TextStyle(
                            color: Color(0xFF2E7835),
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        const SizedBox(width: 10,),
                        DropdownButton<String>(
                            hint: Text(selectedTruckType ?? 'Select'),
                            value: selectedTruckType,
                            items: vehicle.map((String type){
                              return DropdownMenuItem(
                                value: type,
                                child: Text(type),
                              );
                            }).toList(),
                            onChanged:(String? newvalue){
                              setState(() {
                                selectedTruckType=newvalue;
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
                        children: vehicleList.where(
                          //filtering on the basis of dropdown selection
                          (vehicle)=> 
                          vehicle.vehicleName==selectedTruckType || //if the vehicle is in the selected type
                          selectedTruckType==null || //if no filter selected
                          selectedTruckType=='Select'
                          ).map((vehicle) {
                          return Column(
                            children: [
                              vehicleCard(context, vehicle),
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
//frontend code for vehicle
Widget vehicleCard(BuildContext context, Vehicle vehicle){
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
            const Image(image: AssetImage('assets/vehicle.jpg'),
            height: 50,
            width: 40,),
            const SizedBox(height: 10,),
            Text('Id ${vehicle.vehicleID.toString()}',
            style: const TextStyle(fontWeight: FontWeight.bold),),
          ],

        ),
        const SizedBox(width: 30,),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                SizedBox(width: 165,),
                GestureDetector(
                  onTap: () {
                    deletevehicle(context,vehicle); 
                  },
                  child: Icon(
                     Icons.delete,
                  ),
                ),
              ],

            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                const Text('Name: ',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  
                  ),
                ),
                Text(vehicle.vehicleName,
                ),
                
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
                Text(vehicle.vehicleCapacity, ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                const Text('Fuel Type: ',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  ),
                ),
                Text(vehicle.vehicleFuelType.toString(),
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
//defining a class for vehicles
class Vehicle{
  int vehicleID=0;
  String vehicleName='';
  String vehicleCapacity='';
  String vehicleFuelType='';
  //constructor
  Vehicle(int iD,String name, String capacity, String fuelType)
  {
    vehicleID=iD;
    vehicleName=name;
    vehicleCapacity=capacity;
    vehicleFuelType=fuelType;
  }
}

//method to delete details of an vehicle
void deletevehicle(BuildContext context, Vehicle vehicle){
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
          const Text('Are you sure you want to remove this vehicle?',
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
