import 'package:flutter/material.dart';
import 'admin_bottom_section.dart';

class AdminHireEmployee extends StatelessWidget {
  const AdminHireEmployee({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar( 
        backgroundColor:const  Color(0xFFE6F3EC),
        title: const Text("Hire Employee",
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
            inputfields('Employee ID', "Enter employee's ID"),
            inputfields('Name', 'Enter your full name'),
            inputfields('Email', 'Enter your email address'),
            inputfields('Contact Number', 'Enter your contact number'),
            const SizedBox(height: 8,),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text('  Add a Profile Picture',
                style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                ),
                ),
                const SizedBox(height: 10,),
                Container(
                  padding: const EdgeInsets.only(top: 5, bottom: 5, left:25),
                  margin: const EdgeInsets.only(left: 10, right: 10),
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.black, width: 3),
                  ),
                  child: const Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      IconButton(onPressed: null, icon: Icon(Icons.upload_file)),
                      SizedBox(width: 15,),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text('Drag and Drop here',
                          style: TextStyle(
                            fontSize: 16,
                          ),),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Text('or ',style: TextStyle(
                              fontSize: 16,
                              ),),
                              Text('Browse',style: TextStyle(color: Colors.blue,fontSize: 16),
                              ),
                            ],
                          )
                        ],
                      )
                    ],
                  ),
                ),
              ],
            ),
            const SizedBox(height: 8,),
            inputfields('Password', 'Enter your password'),
            inputfields('Confirm Password', 'Confirm your password'),
            const SizedBox(height: 16,),
            Container(
              width: 160,
              child: const FloatingActionButton(onPressed: null,
              backgroundColor: Color(0xFF2E7835),
              child: Text('Create Account',
              style: TextStyle(
              color: Colors.white,
              
            ),
            ),
            ),
            
            ),
            const SizedBox(height: 26),
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