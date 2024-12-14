import 'package:flutter/material.dart';
import 'admin_bottom_section.dart';
import 'admin_add_vehicle.dart';
import 'admin_view_vehicles.dart';

class AdminManageVehicle extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar( 
        backgroundColor:const  Color(0xFFE6F3EC),
        title: const Text("Manage Vehicles",
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
                  //card showing the registered vehicles
                  statCard(10," Active Vehicles "),
                  //card showing the inactive vehicles
                  statCard(10,"Inactive Vehicles"),
                ],
              ),
            ),
            //spacing
            const SizedBox(height: 12),
            //View Vehicles Card
            createCard(context,'assets/vehicle.jpg','View Vehicles', 'Access vehicles’ information\nand remove old ones',const AdminViewVehicles()),
            //Add Vehicle Card
            createCard(context,'assets/truckk.jpg','Add Vehicle', 'Register a new waste collection truck', const AdminAddVehicle()),
            
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

//function to create separate containers for each functionality

Widget createCard(BuildContext context, imagepath,String titlee, String description, Widget nextpage){
  return Container(
    padding: const EdgeInsets.all(16),
    margin: const EdgeInsets.all(18),
    decoration: BoxDecoration(
      borderRadius: BorderRadius.circular(10),
      border: Border.all(
        color: const Color(0xFF2E7835),
        width: 3,
      ),
      color: Colors.white,
    ),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Image.asset(imagepath,
        height: 80,
        width:80,
        ),
        const SizedBox(width: 12,),
        Expanded(
          child:Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                 Text(titlee, 
                style: const TextStyle(
                  fontWeight: FontWeight.bold,
                ),
                ),
                const SizedBox(width: 10),
                GestureDetector(
                  onTap: (){
                    Navigator.push(
                      context, MaterialPageRoute(builder: (context)=>nextpage,
                      ),
                      );
                  },
                child: const Icon(Icons.arrow_forward),
                )
              ],
            ),
            const Divider(
              color: Colors.black,
              thickness: 1,
            ),
            const SizedBox(height: 5,),
            Text(description,
            style: const TextStyle(
              fontSize: 12,
            ),
            ),
          ],
        ),
        ),
      ],
    ),
  );
}