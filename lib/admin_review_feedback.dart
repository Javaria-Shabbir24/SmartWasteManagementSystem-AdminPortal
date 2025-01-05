import 'package:flutter/material.dart';
import 'admin_bottom_section.dart';
import 'admin_menu.dart';

class AdminReviewFeedback extends StatefulWidget {
  const AdminReviewFeedback({super.key});

  @override
  State<AdminReviewFeedback> createState() => _AdminReviewFeedbackState();
}

class _AdminReviewFeedbackState extends State<AdminReviewFeedback> {
  // dummy data
  // add the status thing
  // sepaarte on the basis of replied and unreplied feedbacks
  List<Feedback> feedbackList = [
    Feedback(1, 'Mashal Pervaiz', 'Complaint', 'The bin is overflowing'),
    Feedback(2, 'Ali Nasir', 'Question', 'Can I change my bin schedule time?'),
    Feedback(3, 'Ayesha Omar', 'Suggestion', 'Residents should be able to see Data Analytics.'),
    Feedback(4, 'Razia Saleem', 'Question', 'How to register a waste bin?'),
  ];
 
  //variable to store the selected feedback type
  String? selectedFeedbackType;
  @override
  Widget build(BuildContext context) {
    //list of feedback types
    List<String> feedbackTypes=['Complaint','Suggestion','Question'];
    return Scaffold(
      appBar: AppBar( 
        backgroundColor:const  Color(0xFFE6F3EC),
        title: const Text("Review Feedback",
        style: TextStyle(
          color: Colors.black,
          fontWeight: FontWeight.bold,
         ),
        ),
      ),
      endDrawer:AdminMenu(),
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
              decoration: BoxDecoration(
                border: Border.all(color: const Color(0xFF2E7835),width: 9),
                borderRadius: BorderRadius.circular(10),
                color: Colors.white,
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
                        const SizedBox(width: 12,),
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
                        children: feedbackList.where(
                          //filtering on the basis of dropdown selection
                          (feedback)=> 
                          feedback.feedbackType==selectedFeedbackType || //if the feedback is in the selected type
                          selectedFeedbackType==null || //if no filter selected
                          selectedFeedbackType=='Select'
                          ).map((feedback) {
                          return Column(
                            children: [
                              feedbackCard(context, feedback),
                              const SizedBox(height: 20),
                            ],
                          );
                        }).toList(),
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
Widget feedbackCard(BuildContext context, Feedback feedback){
  return Container(
    padding: const EdgeInsets.all(10),
    decoration: BoxDecoration(
      border: Border.all(color: Colors.black,width: 3),
      borderRadius: BorderRadius.circular(10),
      color: Colors.white,
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
            Text(feedback.residentID.toString()),
            const SizedBox(width: 150,),
            //icon to edit the feedbacks
            GestureDetector(
              onTap: () {
                responseToFeedback(context, feedback);
              },
              child: const Icon(Icons.reply,
              color: Color(0xFF2E7835),),
            )
            
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
            Text(feedback.residentName),
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
            Text(feedback.feedbackType,
            style:const TextStyle(
              color: Colors.red,
            ),),
          ],
        ),
        Wrap(
          children: [
            Text(
              feedback.descriptionn,
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
class Feedback{
  int residentID=0;
  String residentName='';
  String feedbackType='';
  String descriptionn='';
  //constructor
  Feedback(int iD,String name, String feedbacktype, String description)
  {
    residentID=iD;
    residentName=name;
    feedbackType=feedbacktype;
    descriptionn=description;
  }
}
//method to reply to resident
void responseToFeedback(BuildContext context, Feedback feedback){
  showDialog(
  context: context,
  builder: (BuildContext context){
    return AlertDialog(
      title: const Text('   Feedback Response', style: 
      TextStyle(
          fontSize: 22,
          fontWeight: FontWeight.bold
        ),
      ),
      content: 
      Container(
        height: 320,
        child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Divider(
            color: Colors.black,
            thickness: 3,

          ),
          const SizedBox(height: 10,),
          Text('Reply to ${feedback.residentName}',
          style: const TextStyle(
            fontSize: 16,
          ),
          ),
          const SizedBox(height: 20,),
          const TextField(
            maxLines: 5,
            decoration: InputDecoration(
              border: OutlineInputBorder(),
              hintText: 'Type your response here...',
            ),
          ),
          const SizedBox(height: 20,),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
                  SizedBox(width: 100,
                  child:FloatingActionButton(onPressed: (){
                    Navigator.pop(context);
                    }, 
                  backgroundColor: Colors.white,
                  child: const Text('Cancel', 
                    style: TextStyle(color: Colors.black,)
                    ),
                ),
              ),
              const SizedBox(width: 100,
                  child:FloatingActionButton(onPressed: null, 
                  backgroundColor: Color(0xFF2E7835),
                  child: Text('Send', 
                    style: TextStyle(color: Colors.white,)
                    ),
                ),
              ),
            ],
          ),
        ],
      ),
      ),
    );
  }
  );
}