import 'package:flutter/material.dart';
import 'admin_bottom_section.dart';

class AdminAddVehicle extends StatelessWidget {
  const AdminAddVehicle({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar( 
        backgroundColor:const  Color(0xFFE6F3EC),
        title: const Text("Add Vehicle",
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
        padding: const EdgeInsets.only(left: 5, right: 5),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            const Divider(
            color: Colors.black,
            thickness: 1,
            ),
            const SizedBox(height: 20),
            inputfields('Driver ID', "Enter driver's ID"),
            inputfields('Name', 'Enter vehicle\'s name'),
            inputfields('Capacity', 'Enter vehicle\'s capacity'),
            inputfields('Fuel Type', 'Enter vehicle\'s fuel type'),
            const SizedBox(height: 16,),
            Container(
              width: 160,
              child: const FloatingActionButton(onPressed: null,
              backgroundColor: Color(0xFF2E7835),
              child: Text('Add Vehicle',
              style: TextStyle(
              color: Colors.white,
              
            ),
            ),
            ),
            ),
          ],
        )
         
      
      ),
      bottomNavigationBar: AdminBottomSection(),
    );
  }
}

Widget inputfields(String titlee, String placeholder){
  return Container(
    padding: const EdgeInsets.all(12),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(titlee,
        style: const TextStyle(
          fontSize: 18,
          fontWeight: FontWeight.bold,

        ),
        ),
        const SizedBox(height: 6,),
        TextField(
          decoration: InputDecoration(
            hintText: placeholder,
            border: OutlineInputBorder(borderRadius: BorderRadius.circular(5)),
          ),
        )
      ],
    )
  );
}