import 'dart:ui';

import 'package:flutter/material.dart';

class Franchise extends StatefulWidget {
  const Franchise({Key? key}) : super(key: key);

  @override
  _FranchiseState createState() => _FranchiseState();
}

class _FranchiseState extends State<Franchise> {
  var interestedIn=[  "IELTS",
    "Passport",
    "Study Visa",
    "Education Loan",
    "Air Ticket",
    "Travel Insurance",
    "Money Exchange",
    "Transportation",
    "Luggage Adjustment",
    "Accommodation at Abraod",
    "Jobs at Abroad",
    "Tour Travel",
    "Work Permit",
    "Permanent Residence",
    "Tourism & Business Visa",
    "Events",
    "Job requirements",
    "International Courier",
    "Legal Advisor",
    "Online IELTS Classes",
    "user.jpeg",
    "Check Your Score"];
  var areaType=['"Commercial", "Residential", "SCO", "Booth", "Plot"'];
  var floorNo=[ "Ground Floor",
    "First Floor",
    "Second Floor",
    "Third Floor",
    "Fourth Floor",
    "Sixth Floor",
    "Other"];
  var area=['"Commercial", "Residential", "SCO", "Booth", "Plot"'];
  TextEditingController interestedinController = TextEditingController();
  TextEditingController areatypeController = TextEditingController();
  TextEditingController phonenoController = TextEditingController();
  TextEditingController qualificationController = TextEditingController();
  TextEditingController totalAreaController = TextEditingController();
  TextEditingController floorAreaController = TextEditingController();
  TextEditingController areaController = TextEditingController();
  TextEditingController adharCardController = TextEditingController();
  TextEditingController PanCardController = TextEditingController();
  TextEditingController ReadyToInvestController = TextEditingController();

  var dropdownValue;

  @override
  Widget build(BuildContext context) {


    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        title:  TextButton(onPressed: (){},
            child: const Center(
              child: Text('Immigration Adda',
                style:  TextStyle(
                    fontSize: 18,
                    color: Colors.lightBlue
                ),),
            )),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            textfield(context, interestedinController, 'Interested In :',),
            Container(padding: EdgeInsets.symmetric(horizontal: 10.0),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10.0),
                border: Border.all(
                    color: Colors.blue, style: BorderStyle.solid, width: 0.80),
              ),
              child: DropdownButtonHideUnderline(
                child: DropdownButton<String>(
                  value: dropdownValue,
                  isExpanded: true,
                  elevation: 16,
                  hint: Text('Interested In'),

                  style: const TextStyle(color: Colors.blue, fontSize: 18,

                  ),
                  underline: Container(
                    width: MediaQuery.of(context).size.width,
                    height: 1,
                    color: Colors.deepPurpleAccent,
                  ),
                  onChanged: (value) {
                    dropdownValue=value.toString();
                  },
                  items: interestedIn.map<DropdownMenuItem<String>>((String value) {
                    return DropdownMenuItem<String>
                      (
                      value: value,
                      child: Text(value),
                    );
                  }).toList(),
                ),
              ),
            ),
            textfield(context, areatypeController, 'Area Type :'),
            Container(padding: EdgeInsets.symmetric(horizontal: 10.0),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10.0),
                border: Border.all(
                    color: Colors.blue, style: BorderStyle.solid, width: 0.80),
              ),
              child: DropdownButtonHideUnderline(
                child: DropdownButton<String>(
                  value: dropdownValue,
                  hint: Text('Area Type'),
                  isExpanded: true,
                  elevation: 16,

                  style: TextStyle(color: Colors.blue, fontSize: 18,

                  ),
                  underline: Container(
                    width: MediaQuery.of(context).size.width,
                    height: 1,
                    color: Colors.deepPurpleAccent,
                  ),
                  onChanged: (value) {
                    dropdownValue=value.toString();
                  },
                  items: areaType.map<DropdownMenuItem<String>>((String value) {
                    return DropdownMenuItem<String>
                      (
                      value: value,
                      child: Text(value),
                    );
                  }).toList(),
                ),
              ),
            ),

            textfield(context, phonenoController, 'Phone Number :'),
            textfield(context, qualificationController, 'Qualification :'),
            textfield(context, totalAreaController, 'Total Area :'),
            textfield(context, floorAreaController, 'Floor Area :'),
            Container(padding: EdgeInsets.symmetric(horizontal: 10.0),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10.0),
                border: Border.all(
                    color: Colors.blue, style: BorderStyle.solid, width: 0.80),
              ),
              child: DropdownButtonHideUnderline(
                child: DropdownButton<String>(
                  value: dropdownValue,
                  isExpanded: true,
                  hint: Text('Floor Area'),
                  elevation: 16,

                  style: TextStyle(color: Colors.blue, fontSize: 18,

                  ),
                  underline: Container(
                    width: MediaQuery.of(context).size.width,
                    height: 1,
                    color: Colors.deepPurpleAccent,
                  ),
                  onChanged: (value) {
                    dropdownValue=value.toString();
                  },
                  items: floorNo.map<DropdownMenuItem<String>>((String value) {
                    return DropdownMenuItem<String>
                      (
                      value: value,
                      child: Text(value),
                    );
                  }).toList(),
                ),
              ),
            ),

            textfield(context, areaController, 'Area :'),
            Container(padding: EdgeInsets.symmetric(horizontal: 10.0),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15.0),
                border: Border.all(
                    color: Colors.blue, style: BorderStyle.solid, width: 0.80),
              ),
              child: DropdownButtonHideUnderline(
                child: DropdownButton<String>(
                  value: dropdownValue,
                  isExpanded: true,
                  elevation: 16,

                  style: TextStyle(color: Colors.blue, fontSize: 18,

                  ),
                  underline: Container(
                    width: MediaQuery.of(context).size.width,
                    height: 1,
                    color: Colors.deepPurpleAccent,
                  ),
                  onChanged: (value) {
                    dropdownValue=value.toString();
                  },
                  items: area.map<DropdownMenuItem<String>>((String value) {
                    return DropdownMenuItem<String>
                      (
                      value: value,
                      child: Text(value),
                    );
                  }).toList(),
                ),
              ),
            ),
            textfield(context, adharCardController, 'Aadhar Card Number :'),
            textfield(context, PanCardController, 'Pan Card Number :'),
            textfield(context, ReadyToInvestController, 'Ready to invest :'),
            GestureDetector(
              onTap: () {
                // getImage();
              },
              child: Container(
                height: 200,
                width: 200,
                child: Card(
                  elevation: 1,
                  child:  Container(
                    decoration: const BoxDecoration(
                      image:
                      DecorationImage(image: AssetImage('')),
                    ),

                  ),

                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8),
              child: Container(
                height: 40, width: 320,
                //color: Color(0xff0d47a1),
                decoration:
                BoxDecoration(borderRadius: BorderRadius.circular(20)),
                child: ElevatedButton(
                  style: ButtonStyle(
                    backgroundColor: MaterialStateColor.resolveWith(
                          (states) =>  Colors.blue,
                    ),
                    shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                      RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(40.0),
                      ),
                    ),
                  ),
                  onPressed: () {

                  },
                  child: const Text(
                    "Update",
                    style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 24),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );


  }
  Widget textfield(BuildContext context,TextEditingController controller,String hint){
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: TextField(

        controller: controller,
        decoration: InputDecoration(
            contentPadding: const EdgeInsets.only(top:15,bottom: 6,left: 10),
            border: const OutlineInputBorder(),
            labelText: hint
        ),
      ),
    );

  }
}