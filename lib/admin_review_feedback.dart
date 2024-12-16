import 'package:flutter/material.dart';
import 'admin_bottom_section.dart';

class AdminReviewFeedback extends StatefulWidget {
  const AdminReviewFeedback({super.key});

  @override
  State<AdminReviewFeedback> createState() => _AdminReviewFeedbackState();
}

class _AdminReviewFeedbackState extends State<AdminReviewFeedback> {
  @override
  Widget build(BuildContext context) {
    //list of feedback types
    List<String> feedbackTypes=['Complaints','Suggestions','Questions'];
    //variable to store the selected feedback type
    String? selectedFeedbackType;
    return Scaffold(
      appBar: AppBar( 
        backgroundColor:const  Color(0xFFE6F3EC),
        title: const Text("Review Feedback",
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
        child: Column(
          
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            
            Divider(
              color: Colors.black,
              thickness: 1,
            ),
            Container(
              padding: EdgeInsets.all(7),
              margin: EdgeInsets.only(top: 10),
              decoration: BoxDecoration(
                border: Border.all(color: Color(0xFF2E7835),width: 3),
              ),
              child: Text('Employee feedback on waste management\nis available for your review.',
              style: TextStyle(
              fontSize: 16,
            ),

            )
            
            ),
            const SizedBox(height: 15,),
            Container(
              padding: EdgeInsets.only(left: 14,right: 14,top: 5,bottom: 5),
              
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  //dropdown for selecting the feedback type
                  Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Text(
                          'Select Feedback Type:',
                          style: TextStyle(
                            color: const Color(0xFF2E7835),
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        SizedBox(width: 10,),
                        Container(
                            decoration: BoxDecoration(
                              color: Colors.grey,
                              border: Border.all(color: Color(0xFF2E7835)),
                            ),
                            child: DropdownButton<String>(
                            hint: Text(selectedFeedbackType ?? 'Select'),
                            value: selectedFeedbackType,
                            items: feedbackTypes.map((String type){
                              return DropdownMenuItem(
                                value: type,
                                child: Text(type),
                              );
                            }).toList(),
                            onChanged:(String? newvalue){
                              setState(() {
                                selectedFeedbackType=newvalue;
                              });
                              
                            },
                            
                          ),
                        ),
                      ],
                  ),
                ],
              )
            )
          ],
        ),
      ),
      //bottom navigation bar
      bottomNavigationBar: AdminBottomSection(),
    );
  }
}