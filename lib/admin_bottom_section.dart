import 'package:flutter/material.dart';
import 'admin_about.dart';
import 'admin_notifications.dart';
import 'admin.dart';
import 'admin_profile.dart';

class AdminBottomSection extends StatefulWidget {
  @override
  State<AdminBottomSection> createState() => _AdminBottomSectionState();
}

class _AdminBottomSectionState extends State<AdminBottomSection> {
  int selectedIndex=0;

  void tappedFunction(int index){
    setState(() {
      selectedIndex=index;
    });
    switch(index){
      case 0:
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context)=>Admin()
        ) 
      );
      case 1:
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context)=>AdminNotifications()
        ) 
      );
      case 2:
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context)=>AdminAbout()
        ) 
      );
      case 3:
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context)=>AdminProfile()
        ) 
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      currentIndex: selectedIndex,
      onTap: tappedFunction,
      type: BottomNavigationBarType.fixed,
          items: [
            BottomNavigationBarItem(
              icon: Icon(Icons.home, color: Colors.white),
              label: "Home",
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.notifications, color: Colors.white),
              label: "Notifications",
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.info, color: Colors.white),
              label: "About",
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.person, color: Colors.white),
              label: "Profile",
            ),
          ],
          backgroundColor: const  Color(0xFF2E7835),
          selectedItemColor: Colors.white,
          unselectedItemColor: Colors.white,
        );
  }
}