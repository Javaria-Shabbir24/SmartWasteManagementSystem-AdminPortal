import 'package:flutter/material.dart';
import 'admin_bottom_section.dart';

class AdminNotifications extends StatefulWidget {
  @override
  AdminNotificationsState createState() => AdminNotificationsState();
}

class AdminNotificationsState extends State<AdminNotifications> {
  final List<Map<String, dynamic>> notifications = [
    {
      "title": "Bin 2: Waste has been successfully picked up.",
      "isOpened": false
    },
    {
      "title": "Bin 5: Reached 80% capacity, action required.",
      "isOpened": false
    },
    {
      "title":
          "Driver assigned to Bin 3 for waste collection.",
      "isOpened": false
    },
    {
      "title": "Bin 1 status updated to 'Empty' after collection.",
      "isOpened": false
    },
    {
      "title": "Bin 10: Overfilled, immediate collection needed.",
      "isOpened": false
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Notifications'),
        backgroundColor: Color(0xFFEFF4E9), // Green-themed AppBar
      ),
      body: Container(
        
        color: Color(0xFFEFF4E9), // Light background color
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: ListView.separated(
            itemCount: notifications.length,
            separatorBuilder: (context, index) => Divider(
              color: Colors.grey,
              thickness: 0.5,
            ),
            itemBuilder: (context, index) {
              return ListTile(
                leading: Icon(
                  Icons.notifications,
                  color: Colors.green,
                ),
                title: Text(
                  notifications[index]["title"],
                  style: TextStyle(
                    fontSize: 16.0,
                    color: Colors.black,
                    fontWeight: notifications[index]["isOpened"]
                        ? FontWeight.normal
                        : FontWeight.bold, // Bold if not opened
                  ),
                ),
                subtitle: Text(
                  "Received on: ${DateTime.now().subtract(Duration(days: index)).toLocal()}",
                  style: TextStyle(
                    fontSize: 12.0,
                    color: Colors.grey,
                  ),
                ),
                onTap: () {
                  setState(() {
                    notifications[index]["isOpened"] = true; // Mark as opened
                  });
                  showDialog(
                    context: context,
                    builder: (BuildContext context) {
                      return AlertDialog(
                        title: Text('Notification Details'),
                        content: Text(notifications[index]["title"]),
                        actions: [
                          TextButton(
                            onPressed: () {
                              Navigator.of(context).pop();
                            },
                            child: Text('Close'),
                          ),
                        ],
                      );
                    },
                  );
                },
              );
            },
          ),
        ),
      ),
      bottomNavigationBar: AdminBottomSection(),
    );
  }
}
