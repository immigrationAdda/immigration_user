import 'dart:convert';
import 'dart:io';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:immigration/Models/requirementPost.dart';
import 'package:http/http.dart' as http;
import '../SizeConfig.dart';
import '../constants.dart';

class UserPost extends StatefulWidget {
  const UserPost({Key? key}) : super(key: key);

  @override
  _UserPostState createState() => _UserPostState();
}

class _UserPostState extends State<UserPost> {
  var titleController = new TextEditingController();
  var mobileNoController = new TextEditingController();
  var qualificationController = new TextEditingController();
  var describeController = new TextEditingController();

  submit() async {
    final String auth = "FirebaseAuth.instance.currentUser!.uid";

    RequirementPost requirementPost = new RequirementPost(uId: auth,
        category: dropdownValue,
        title: titleController.value.text,
        mobileNo:mobileNoController.value.text,
        qualification: qualificationController.value.text,
        required: dropdownValue1,
        describeYourRequirement:describeController.value.text,
        postImage: "postImage");
    var res = await http.post(
        Uri.parse(
            "https://frozen-savannah-16893.herokuapp.com/User/requirementPost"),
        body: json.encode(requirementPost.toJson()), headers: {
      'Accept': 'application/json',
      'Content-Type': 'application/json'
    });
    if (res.statusCode == 200) {
      print("Luggage Post Success fully complete");
    } else {
      print("Luggage Post failed fully complete${res.statusCode}");
    }
  }

  List <String> spinnerItems = [
    "IELTS",
    "Passport",
    "Study Visa",
    "Education Loan",
    "Air Ticket",
    "Travel Insurance",
    "Money Exchange",
    "Transportation",
    "Luggage Adjustment",
    "Accommodation at Aboard",
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
    "Check Your Score"
  ];

  List <String> requirement = [
    "Urgently",
    "1 Week",
    "15 Days",
    "1 Month",
    "3 Month",
    "6 Month"
  ];

  String dropdownValue = "One";
  String dropdownValue1 = "One";

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    var _image;
    Future<void> getLostData() async {
      final ImagePicker picker = ImagePicker();
      final XFile? image = await picker.pickImage(source: ImageSource.gallery);
      setState(() {
        File file = new File(image!.path);
        _image = file;
      });
    }

    return Scaffold(
      appBar: AppBar(
        actions: [

          IconButton(
              onPressed: null, icon: Icon(Icons.search, color: kBlueColor,
          ))
        ],
        leading: Image.asset("assets/images/logo.png"),
        backgroundColor: Colors.white,
        title: Text("Immigration Adda",
          style: TextStyle(color: kBlueColor),),
      ), body: Container(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: ListView(
          children: [
            Container(
              width: MediaQuery
                  .of(context)
                  .size
                  .width,
              alignment: Alignment.center,
              child: Text("Post", style: TextStyle(fontSize: 30,
                  color: kBlueColor,
                  fontWeight: FontWeight.bold),),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                padding: EdgeInsets.symmetric(horizontal: 10.0),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10.0),
                  border: Border.all(
                      color: kBlueColor, style: BorderStyle.solid, width: 0.80),
                ),
                child: DropdownButtonHideUnderline(
                  child: DropdownButton<String>(
                    hint: Text("Select Category"),
                    isExpanded: true,
                    elevation: 16,
                    style: TextStyle(color: kBlueColor, fontSize: 18,

                    ),
                    underline: Container(
                      width: MediaQuery
                          .of(context)
                          .size
                          .width,
                      height: 1,
                      color: Colors.deepPurpleAccent,
                    ),
                    onChanged: (value) {
                      dropdownValue = value.toString();
                    },
                    items: spinnerItems.map<DropdownMenuItem<String>>((
                        String value) {
                      return DropdownMenuItem<String>
                        (
                        value: value,
                        child: Text(value),
                      );
                    }).toList(),
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextField(
                style: TextStyle(
                    fontSize: 20
                ),
                decoration: InputDecoration(
                    contentPadding: EdgeInsets.only(
                        top: 15, bottom: 6, left: 10),
                    border: OutlineInputBorder(
                    ),
                    labelText: "Title "

                ),
              ),
            ), Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextField(
                style: TextStyle(
                    fontSize: 20
                ),
                decoration: InputDecoration(
                    contentPadding: EdgeInsets.only(
                        top: 15, bottom: 6, left: 10),
                    border: OutlineInputBorder(
                    ),
                    labelText: "Mobile No "

                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextField(
                style: TextStyle(
                    fontSize: 20
                ),
                keyboardType: TextInputType.phone,
                decoration: InputDecoration(
                    contentPadding: EdgeInsets.only(
                        top: 15, bottom: 6, left: 10),
                    border: OutlineInputBorder(
                    ),
                    labelText: "Qualification"


                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextField(
                style: TextStyle(
                    fontSize: 20
                ),
                decoration: InputDecoration(
                    contentPadding: EdgeInsets.only(
                        top: 15, bottom: 6, left: 10),
                    border: OutlineInputBorder(
                    ),
                    labelText: "Describe Your Requirement"

                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                padding: EdgeInsets.symmetric(horizontal: 10.0),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10.0),
                  border: Border.all(
                      color: kBlueColor, style: BorderStyle.solid, width: 0.80),
                ),
                child: DropdownButtonHideUnderline(
                  child: DropdownButton<String>(
                    hint: Text("When You Required"),
                    isExpanded: true,
                    elevation: 16,
                    style: TextStyle(color: kBlueColor, fontSize: 18,

                    ),
                    underline: Container(
                      width: MediaQuery
                          .of(context)
                          .size
                          .width,
                      height: 1,
                      color: Colors.deepPurpleAccent,
                    ),
                    onChanged: (value) {
                      dropdownValue1 = value.toString();
                    },
                    items: spinnerItems.map<DropdownMenuItem<String>>((
                        String value) {
                      return DropdownMenuItem<String>
                        (
                        value: value,
                        child: Text(value),
                      );
                    }).toList(),
                  ),
                ),
              ),
            ), GestureDetector(
              onTap: () {
                getLostData();
              },
              child: Card(
                margin: EdgeInsets.all(10),
                child: _image != null
                    ? ClipRRect(
                  borderRadius: BorderRadius.circular(50),
                  child: Image.file(
                    _image,
                    width: 100,
                    height: 200,
                    fit: BoxFit.cover,
                  ),
                )
                    : Container(
                  decoration: BoxDecoration(
                      color: Colors.white,
                      border: Border.all(color: Colors.black45, width: 0.8),
                      borderRadius: BorderRadius.circular(3)),
                  width: 100,
                  height: 200,
                  child: Icon(
                    Icons.camera_alt,
                    size: 70,
                    color: Colors.grey[400],
                  ),
                ),
              ),
            ),
            Container(


              child: Padding(
                padding: const EdgeInsets.symmetric(
                    vertical: 10, horizontal: 50),
                child: TextButton(
                  clipBehavior: Clip.antiAliasWithSaveLayer,
                  style: TextButton.styleFrom(
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(30)
                      ),

                      backgroundColor: kBlueColor
                  ),
                  onPressed: () {
                    print("gfffffffffffffff---------");
                    submit();
                  },
                  child: Padding(
                    padding: const EdgeInsets.all(2.0),
                    child: Text("Submit", style: TextStyle(
                        color: Colors.white,
                        fontSize: SizeConfig.screenHeight! / 40
                    ),),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),

    ),
    );
  }
}
