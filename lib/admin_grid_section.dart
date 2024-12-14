import 'package:flutter/material.dart';
import 'admin_manage_staff.dart';
import 'admin_manage_vehicle.dart';
import 'admin_review_feedback.dart';
import 'admin_view_bin_info.dart';
import 'admin_view_residents.dart';
import 'admin_manage_leave_requests.dart';

class AdminGridSection extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final List<Map<String, dynamic>> options = [
      {"image": 'assets/staff.png', "label": "Manage Staff", "page": AdminManageStaff()},
      {"image": 'assets/truckicon.jpg', "label": "Manage Vehicle", "page": AdminManageVehicle()},
      {"image": 'assets/feedback1.png', "label": "Review Feedback", "page": AdminReviewFeedback()},
      {"image": 'assets/bin1.png', "label": "View Bin Info", "page": AdminViewBinInfo()},
      {"image": 'assets/resident.png', "label": "View Residents", "page": AdminViewResidents()},
      {"image": 'assets/leave.png', "label": "Manage Leave \nRequest", "page": AdminManageLeaveRequests()},
    ];
    
    return Padding(
      padding: const EdgeInsets.only(left: 27, right:27),
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
              // Navigate to the selected page on button click
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => options[index]['page']),
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
