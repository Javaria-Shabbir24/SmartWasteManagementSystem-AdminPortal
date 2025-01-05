import 'package:flutter/material.dart';
import 'admin_bottom_section.dart';
import 'admin_menu.dart';

class AdminProfile extends StatelessWidget {
  const AdminProfile({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar( 
        backgroundColor:const  Color(0xFFE6F3EC),
        title: const Text("Edit Profile",
        style: TextStyle(
          color: Colors.black,
          fontWeight: FontWeight.bold,
         ),
        ),
      ),
      endDrawer:AdminMenu(),
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
            inputfields('Name', 'Javaria Shabbir'),
            inputfields('Email Address', 'javaria@gmail.com'),
            inputfields('Contact Number', '03357768556'),
            inputfields('Password', 'jav123'),
            const SizedBox(height: 8,),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text('  Profile Picture',
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
            const SizedBox(height: 25,),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                SizedBox(width: 50,),
                SizedBox(
                  height: 50,
                  width: 120,
                      child: const FloatingActionButton(onPressed: null,
                      backgroundColor: Colors.white,
                      child: Text('Cancel',
                      style: TextStyle(
                      color: Colors.black, ),
                    ),
                  ),
                ),
                SizedBox(width: 20,),
                SizedBox(
                  height: 50,
                  width: 120,
                      child: const FloatingActionButton(onPressed: null,
                      backgroundColor: Color(0xFF2E7835),
                      child: Text('Save Changes',
                      style: TextStyle(
                      color: Colors.white, ),
                    ),
                  ),
                ),
              ],
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
            suffixIcon: Icon(Icons.edit),
            hintText: placeholder,
            border: OutlineInputBorder(borderRadius: BorderRadius.circular(5)),
          ),
        )
      ],
    )
  );
}