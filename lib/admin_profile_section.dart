import 'package:flutter/material.dart';

class adminprofilesection extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
        margin: EdgeInsets.all(20),
        padding: EdgeInsets.all(16),
        //structure of the container
        decoration: BoxDecoration(
          color: Color(0xFF2E7835),
          borderRadius: BorderRadius.circular(10),
        ),
        child: const Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
               children: [
                //Circle portion for profile picture
                CircleAvatar(
                   radius: 30,
                   backgroundColor: Colors.white,
                   child: Column(
                    children:[ 
                    Icon(
                    Icons.person, size: 40,color: Colors.black,
                   ),
                   Text('Upload Picture',
                   style: TextStyle(
                     fontSize: 5,
                   ),),
                   
                   ],
                   ),
                   
                ),
               ],
            ),
          ],
        ),
    );
  }
}