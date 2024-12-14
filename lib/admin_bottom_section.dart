import 'package:flutter/material.dart';

class AdminBottomSection extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: const BottomAppBar(
        color:  Color(0xFF2E7835),
        child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          //home icon
            Column(
              children: [
                IconButton(
                  onPressed: null,
                  icon: Icon(Icons.home, color: Colors.white, size: 30,),
                ),
                Text('Home', style: TextStyle(color: Colors.white, fontSize: 5,fontWeight: FontWeight.bold),
                ),
              ],
            ),
          //Notifications icon
            Column(
              children: [
                IconButton(
                  onPressed: null,
                  icon: Icon(Icons.notifications, color: Colors.white,size: 30,),
                ),
                Text('Notifications', style: TextStyle(color: Colors.white, fontSize: 5,fontWeight: FontWeight.bold),
                ),
              ],
            ),
          //About icon
            Column(
              children: [
                IconButton(
                  onPressed: null,
                  icon: Icon(Icons.description_outlined, color: Colors.white,size: 30,),
                ),
                Text('About', style: TextStyle(color: Colors.white, fontSize: 5,fontWeight: FontWeight.bold),
                ),
              ],
            ),
          //Profile icon
            Column(
              children: [
                IconButton(
                  onPressed: null,
                  icon: Icon(Icons.person, color: Colors.white,size: 30,),
                ),
                Text('Profile', style: TextStyle(color: Colors.white, fontSize: 5,fontWeight: FontWeight.bold),
                ),
              ],
            ),


        ],
        ),
      ),
    );
  }
}