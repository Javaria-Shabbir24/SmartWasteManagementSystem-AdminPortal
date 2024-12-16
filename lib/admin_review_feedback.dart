import 'package:flutter/material.dart';
import 'admin_bottom_section.dart';

class AdminReviewFeedback extends StatefulWidget {
  const AdminReviewFeedback({super.key});

  @override
  State<AdminReviewFeedback> createState() => _AdminReviewFeedbackState();
}

class _AdminReviewFeedbackState extends State<AdminReviewFeedback> {
  //variable to store the selected feedback type
  String? selectedFeedbackType;
  @override
  Widget build(BuildContext context) {
    //list of feedback types
    List<String> feedbackTypes=['Complaints','Suggestions','Questions'];
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
            
            const Divider(
              color: Colors.black,
              thickness: 1,
            ),
            Container(
              padding: const EdgeInsets.all(7),
              margin: const EdgeInsets.only(top: 10),
              decoration: BoxDecoration(
                border: Border.all(color: const Color(0xFF2E7835),width: 5),
              ),
              child: const Text('Employee feedback on waste management\nis available for your review.',
              style: TextStyle(
              fontSize: 16,
            ),

            )
            
            ),
            const SizedBox(height: 15,),
            Container(
              padding: const EdgeInsets.only(left: 14,right: 14,top: 5,bottom: 5),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  //dropdown for selecting the feedback type
                  Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        const Text(
                          'Select Feedback Type:',
                          style: TextStyle(
                            color: Color(0xFF2E7835),
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        const SizedBox(width: 10,),
                        DropdownButton<String>(
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
                              }
                              );
                            },
                            dropdownColor: Colors.white,
                        ),
                      ],
                  ),
                  Container(
                    padding: const EdgeInsets.all(10),
                    margin: const EdgeInsets.all(10),
                    child: SingleChildScrollView(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          feedbackCard(1,'Momina Raees','Compliant','The bin is overflowing'),
                          const SizedBox(height: 20,),
                          feedbackCard(2,'Ali Nadeem', 'Questions', 'Can I change my bin schedule time?'),
                          const SizedBox(height: 20,),
                          feedbackCard(2,'Ayesha Omar', 'Suggestions', 'Residents shall be able to see Data Analytics.'),
                          const SizedBox(height: 20,),
                          feedbackCard(2,'Razia Saleem', 'Questions', 'How to register a waste bin?'),
                        ],
                      ),
                    ),
                  )
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
//frontend code for feedback
Widget feedbackCard(int ID, String name, String feedbackType, String description){
  return Container(
    padding: const EdgeInsets.all(10),
    decoration: BoxDecoration(
      border: Border.all(color: Colors.black,width: 3),
      borderRadius: BorderRadius.circular(10),
    ),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            const Text('Resident ID: ',
            style: TextStyle(
              fontWeight: FontWeight.bold,
              ),
            ),
            Text(ID.toString()),
            const SizedBox(width: 150,),
            //icon to edit the feedbacks
            const Icon(Icons.reply),
          ],
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            const Text('Name: ',
            style: TextStyle(
              fontWeight: FontWeight.bold,
              ),
            ),
            Text(name),
          ],
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            const Text('Feedback Type: ',
            style: TextStyle(
              fontWeight: FontWeight.bold,
              ),
            ),
            Text(feedbackType,
            style:const TextStyle(
              color: Colors.red,
            ),),
          ],
        ),
        Wrap(
          children: [
            Text(
              description,
              style: const TextStyle(fontSize: 14),
            ),
          ],
        ),
      ],
    ),
  );
}
//backend code
//defining a class for feedbacks
class feedback{
  int? residentID;
  String? name;
  String? feedbacktype;
  String? description;



}