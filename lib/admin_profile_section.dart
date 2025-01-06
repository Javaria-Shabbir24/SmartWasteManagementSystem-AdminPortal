import 'package:flutter/material.dart'; 

class adminprofilesection extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(20),
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color:const  Color(0xFF2E7835),
        borderRadius: BorderRadius.circular(10),
      ),
      child: Column(
        
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Row(
            children: [
              // Circle avatar for profile picture
              CircleAvatar(
                radius: 30,
                backgroundColor: Colors.white,
                child: Column(
                  children: [
                    Icon(
                      Icons.person,
                      size: 40,
                      color: Colors.black,
                    ),
                    Text(
                      'Upload Picture',
                      style: TextStyle(
                        fontSize: 5,
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(width: 16),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Javaria Shabbir',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 19,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text(
                    'Admin',
                    style: TextStyle(
                      fontSize: 13,
                      color: Colors.white,
                    ),
                  ),
                ],
              )
            ],
          ),
          
          const SizedBox(height: 20), 
          // Data Analytics Portion
          Container(
            padding: const EdgeInsets.only(left: 40, top: 7, bottom: 7),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(12),
              
            ),
            child:const Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Text('   Data \nAnalytics',
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w500,
                ),
                ),
                Image(image: AssetImage('assets/graph.png'),
                height: 40,
                width: 160,),

              ],
            ),
          ),
        ],
      ),
    );
  }
}
