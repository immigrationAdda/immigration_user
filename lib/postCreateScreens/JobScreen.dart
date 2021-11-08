import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:immigration/Models/jobPost.dart';
import 'package:immigration/SizeConfig.dart';
import 'package:immigration/constants.dart';
import 'package:http/http.dart' as http;

class JobScreen extends StatefulWidget {
  JobScreen({Key? key}) : super(key: key);

  @override
  _JobScreenState createState() => _JobScreenState();
}

class _JobScreenState extends State<JobScreen> {
  Future<void> getLostData() async {
    final ImagePicker picker = ImagePicker();
    final XFile? image = await picker.pickImage(source: ImageSource.gallery);
    setState(() {
      File file = new File(image!.path);
      _image = file;
    });
  }

  var _image;
  TextEditingController nameController = new TextEditingController();
  TextEditingController phoneNoController = new TextEditingController();
  TextEditingController emailController = new TextEditingController();
  TextEditingController qualificationController = new TextEditingController();
  TextEditingController experienceController = new TextEditingController();
  TextEditingController salaryController = new TextEditingController();
  TextEditingController interestedController = new TextEditingController();
  TextEditingController designationController = new TextEditingController();
  TextEditingController fieldController = new TextEditingController();
  TextEditingController locationController = new TextEditingController();

  submit() async {
    var jobPost = JobPost(
        uId: "flkefk",
        salary: salaryController.text,
        name: nameController.text,
        mobileNo: phoneNoController.text,
        qualification: qualificationController.text,
        exerience: experienceController.text,
        interested: interestedController.text,
        location: locationController.text,
        postImage: "image.jpeg",
        designation: designationController.text,
        email: emailController.text);

    var res = await http.post(
        Uri.parse(
            "https://frozen-savannah-16893.herokuapp.com/User/luggagePost"),
        body: json.encode(jobPost.toJson()),
        headers: {
          'Accept': 'application/json',
          'Content-Type': 'application/json',
        });
    if (res.statusCode == 200) {
      print("Luggage Post Success fully complete");
    } else {
      print("Luggage Post failed fully complete${res.statusCode}");
    }
  }

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Scaffold(
      appBar: AppBar(
        leading: Image.asset("assets/images/logo.png"),
        backgroundColor: Colors.white,
        title: Text(
          "Immigration Adda",
          style: TextStyle(color: kBlueColor),
        ),
      ),
      body: Container(
        child: ListView(
          shrinkWrap: true,
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 15),
              child: Container(
                child: Center(
                  child: Text(
                    "JOB REQUIREMENT",
                    style: TextStyle(
                        fontSize: SizeConfig.screenHeight! / 30,
                        fontWeight: FontWeight.bold,
                        color: kBlueColor),
                  ),
                ),
              ),
            ),
            textfield(context, nameController, "Name"),
            textfield(context, phoneNoController, "Phone No"),
            textfield(context, emailController, "Email"),
            textfield(context, qualificationController, "Qualification"),
            textfield(context, experienceController, "Experience"),
            textfield(context, salaryController, " Expected Salary"),
            textfield(context, interestedController, "Preferred Department"),
            textfield(context, designationController, "Preferred Designation"),
            textfield(context, locationController, "Preferred Location"),
            GestureDetector(
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
                            border:
                                Border.all(color: Colors.black45, width: 0.8),
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
                padding:
                    const EdgeInsets.symmetric(vertical: 10, horizontal: 50),
                child: TextButton(
                  clipBehavior: Clip.antiAliasWithSaveLayer,
                  style: TextButton.styleFrom(
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(30)),
                      backgroundColor: kBlueColor),
                  onPressed: () async {
                    submit();
                    print("gfffffffffffffff---------" +
                        emailController.value.text);
                  },
                  child: Padding(
                    padding: const EdgeInsets.all(2.0),
                    child: Text(
                      "Submit",
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: SizeConfig.screenHeight! / 40),
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

Widget textfield(
    BuildContext context, TextEditingController controller, String hint) {
  return Padding(
    padding: const EdgeInsets.all(8.0),
    child: TextField(
      controller: controller,
      decoration: InputDecoration(
          contentPadding: EdgeInsets.only(top: 15, bottom: 6, left: 10),
          border: OutlineInputBorder(),
          labelStyle: TextStyle(fontWeight: FontWeight.bold),
          labelText: hint),
    ),
  );
}
