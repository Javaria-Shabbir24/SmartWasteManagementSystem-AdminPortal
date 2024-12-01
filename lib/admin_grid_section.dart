import 'package:flutter/material.dart';

class AdminGridSection extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final List<Map<String, dynamic>> options = [
      {"image": 'assets/staff.png', "label": "Manage Staff"},
      {"image": 'assets/truckicon.jpg', "label": "Manage Vehicle"},
      {"image": 'assets/feedback1.png', "label": "Review Feedback"},
      {"image": 'assets/bin1.png', "label": "View Bin Info"},
      {"image": 'assets/resident.png', "label": "View Residents"},
      {"image": 'assets/leave.png', "label": "Manage Leave \nRequest"},
    ];
    
    return Padding(
      padding: const EdgeInsets.all(27),
      child: GridView.builder(
        physics: const NeverScrollableScrollPhysics(), // Prevent inner scrolling
        shrinkWrap: true, 
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2, // Two items per row
          crossAxisSpacing: 10, // Space between columns
          mainAxisSpacing: 10, // Space between rows
          childAspectRatio: 1.5, // Adjusted to reduce width of grid buttons
        ),
        itemCount: options.length,
        itemBuilder: (context, index) {
          return GestureDetector(
            onTap: () {
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(content: Text("${options[index]['label']} clicked!")),
              );
            },
            child: Container(
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(10),
                border: Border.all(color:const  Color(0xFF2E7835), width: 3), // Border outline 
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.3),
                    blurRadius: 10,
                    offset: const Offset(0, 5), 
                  ),
                ],
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center, 
                children: [
                  Image.asset(
                    options[index]['image'],
                    width: 40, 
                    height: 40, 
                  ),
                  const SizedBox(height: 10),
                  Text(
                    options[index]['label'],
                    textAlign: TextAlign.center,
                    style: const TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
