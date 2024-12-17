import 'package:flutter/material.dart';
import 'admin_bottom_section.dart';

class AdminViewResidents extends StatefulWidget {
  const AdminViewResidents({super.key});

  @override
  State<AdminViewResidents> createState() => AdminViewResidentsState();
}

class AdminViewResidentsState extends State<AdminViewResidents> {
  //dummy data
  List<Resident> residentList = [
    Resident(1, 'Ali Anas', 'alianas@gmail.com', 'Iqbal Town',03345567223),
    Resident(2, 'Javad Ali', 'javedali@gmail.com', 'DHA',03345566666),
    Resident(3, 'Afzal Amir', 'afzal1@gmail.com', 'Valencia Town',033324456112),
    Resident(4, 'Omar Anas', 'omar@gmail.com', 'DHA',03004474553),
  ];
 
  //variable to store the selected area 
  String? selectedArea;
  @override
  Widget build(BuildContext context) {
    //list of areas 
    List<String> area=['Iqbal Town','DHA','Valencia Town' ];
    return Scaffold(
      appBar: AppBar( 
        backgroundColor:const  Color(0xFFE6F3EC),
        title: const Text("Residents",
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
              padding: const EdgeInsets.all(10),
              decoration: BoxDecoration(
                border: Border.all(color: const Color(0xFF2E7835),width: 9),
                borderRadius: BorderRadius.circular(10),
                color: Colors.white,
              ),
              child: const Text('The details of registered residents are shown below.',
              style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.bold,
            ),
            )
            ),
            const SizedBox(height: 15,),
            Container(
              padding: const EdgeInsets.only(left: 14,right: 14,top: 5,bottom: 5),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  //dropdown for selecting the leave status
                  Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        const SizedBox(width: 30,),
                        const Text(
                          'Select Location:',
                          style: TextStyle(
                            color: Color(0xFF2E7835),
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        const SizedBox(width: 10,),
                        DropdownButton<String>(
                            hint: Text(selectedArea ?? 'Select'),
                            value: selectedArea,
                            items: area.map((String type){
                              return DropdownMenuItem(
                                value: type,
                                child: Text(type),
                              );
                            }).toList(),
                            onChanged:(String? newvalue){
                              setState(() {
                                selectedArea=newvalue;
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
                        children: residentList.where(
                          //filtering on the basis of dropdown selection
                          (resident)=> 
                          resident.residentAddress==selectedArea || //if the resident is in the selected type
                          selectedArea==null || //if no filter selected
                          selectedArea=='Select'
                          ).map((resident) {
                          return Column(
                            children: [
                              residentCard(context, resident),
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
//frontend code for resident
Widget residentCard(BuildContext context, Resident resident){
  return Container(
    padding: const EdgeInsets.all(10),
    decoration: BoxDecoration(
      border: Border.all(color: Colors.black,width: 3),
      borderRadius: BorderRadius.circular(10),
      color: Colors.white,
    ),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            const Image(image: AssetImage('assets/resident.jpg'),
            height: 50,
            width: 40,),
            const SizedBox(height: 10,),
            Text('Id ${resident.residentID.toString()}',
            style: const TextStyle(fontWeight: FontWeight.bold),),
          ],

        ),
        const SizedBox(width: 30,),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                const Text('Name: ',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  
                  ),
                ),
                Text(resident.residentName,
                ),
                const SizedBox(width: 45,),
                GestureDetector(
                  onTap: () {
                    deleteresident(context,resident); 
                  },
                  child: const Icon(
                     Icons.delete,
                  ),
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                const Text('Email: ',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  ),
                ),
                Text(resident.residentEmail, style: const TextStyle(fontSize: 14),),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                const Text('Contact: ',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  ),
                ),
                Text(resident.residentContactNumber.toString(),
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                const Text('Address: ',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  ),
                ),
                Text(resident.residentAddress,
                
                ),
              ],
            ),
          ],
        ),
        
      ],

    )
    
  );
}
//backend code
//defining a class for residents
class Resident{
  int residentID=0;
  String residentName='';
  String residentEmail='';
  String residentAddress='';
  int residentContactNumber=0;
  //constructor
  Resident(int iD,String name, String email, String address, int contactNumber)
  {
    residentID=iD;
    residentName=name;
    residentEmail=email;
    residentAddress=address;
    residentContactNumber=contactNumber;
  }
}

//method to delete details of an resident
void deleteresident(BuildContext context, Resident resident){
  showDialog(
  context: context,
  builder: (BuildContext context){
    return AlertDialog(
      content: 
      Container(
        height: 180,
        child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(height: 20,),
          const Text('Are you sure you want to remove this resident?',
          style: TextStyle(fontSize: 20,
          ),),
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
                  backgroundColor: Color.fromARGB(255, 133, 23, 15),
                  child: Text('Delete', 
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
