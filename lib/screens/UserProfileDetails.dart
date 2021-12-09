import 'dart:convert';
import 'dart:io';

import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:image_picker/image_picker.dart';
import 'package:http_parser/http_parser.dart';
import 'package:immigration/Models/UserModel.dart';
import 'package:immigration/constants.dart';
import 'package:http/http.dart' as http;

import '../api_config.dart';

class UserProfile extends StatefulWidget {
  final String uId;
 final UserModel? userModel;
  const UserProfile({Key? key, required this.uId, this.userModel}) : super(key: key);

  @override
  _UserProfileState createState() => _UserProfileState();
}

class _UserProfileState extends State<UserProfile> {
  TextEditingController nameController = new TextEditingController();
  TextEditingController phoneNoController = new TextEditingController();
  TextEditingController emailIdController = new TextEditingController();
  TextEditingController dateOfBirthController = new TextEditingController();
  TextEditingController cityController = new TextEditingController();
  var _image;
  late String ProfilePicture;
  int statuscode=0;
  getSubmit() async {
    bool check = false;
    UserModel userModel = new UserModel(uId: "uId",
        name: nameController.text,
        phoneNo: phoneNoController.text,
        email: emailIdController.text,
        city: cityController.text,
        dateOfBirth: dateOfBirthController.text,
        profilePicture: ProfilePicture,);
    var res = await http.post(
        Uri.parse("https://frozen-savannah-16893.herokuapp.com/User/Signup"),
        body:json.encode(userModel.toJson()),
        headers: {
          'Accept': 'application/json',
          'Content-Type': 'application/json',
        });

    if (res.statusCode == 200) {
    setState(() {
    statuscode=res.statusCode;
    });
         print("fffffffffff"+res.body);    check = true;
    // return  Fluttertoast.showToast(msg: "Update Success",toastLength: Toast.LENGTH_LONG);
    }
    return check;
  }
  uploadImage() async {
    Dio dio=new Dio();
    String fileName = _image!.path.split('.').last;
    print(fileName);
    FormData formData = FormData.fromMap({
      "file": await MultipartFile.fromFile(_image!.path,
          contentType: MediaType("image", fileName))
    });
    return await dio
        .postUri(Uri.parse(ApiConfig.BASE_URL + "Seller/upload"), data: formData)
        .then((value) {
      // if (response!.statusCode != 200) {

      // }

      if (value.statusCode == 200) {
        setState(() {
          statuscode=value.statusCode!;
          ProfilePicture=value.toString();  });

        print(value.statusCode!.toString()+"----------"+value.toString());

      }
    });
  }Future<void> getLostData() async {
    final ImagePicker picker = ImagePicker();
    final XFile? image = await picker.pickImage(source: ImageSource.gallery);
    setState(() {
      statuscode=100;

      File file = new File(image!.path);
      _image = file;
      uploadImage();
    });
  }
  @override
  Widget build(BuildContext context) {

    double height = MediaQuery
        .of(context)
        .size
        .height;
    double width = MediaQuery
        .of(context)
        .size
        .width;
    return Scaffold(
      appBar: AppBar(

        leading: Image.asset("assets/images/logo.png"),
        backgroundColor: Colors.white,
        title: Text("Immigration Adda",
          style: TextStyle(color: kBlueColor),),
      ),
      body: Stack(
        children: [
          SafeArea(
          child: SingleChildScrollView(
            child: Padding(
                padding: EdgeInsets.symmetric(vertical: 10, horizontal: 24),
                child:
                ListView(
                  shrinkWrap: true,
                     physics: NeverScrollableScrollPhysics(),
                    children: [
                      GestureDetector(
                        onTap: (){
                          getLostData();
                        },
                        child: Padding(
                          padding: const EdgeInsets.only(bottom: 18.0),
                          child: Center(
                            child: _image != null
                                ?CircleAvatar(
                                radius: 70,
                                backgroundColor: Colors.grey,
                                backgroundImage:FileImage(_image)

                            ):CircleAvatar(
                                radius: 70,
                                backgroundColor: Colors.white,
                                backgroundImage:AssetImage("assets/images/person.png")
                            ),
                          ),
                        ),
                      ),

                      customTextfield(context, nameController, "Name", true,TextInputType.text),
                      customTextfield(
                          context, phoneNoController, "Phone No", false,TextInputType.phone),
                      customTextfield(
                          context, emailIdController, "Email ID", true,TextInputType.emailAddress),
                      customTextfield(
                          context, dateOfBirthController, "Date Of Birth", true,TextInputType.text),
                      customTextfield(context, cityController, "City", true,TextInputType.datetime),
                      SizedBox(height: 30),

                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: 83.0),
                        child: ConstrainedBox(
                          constraints: BoxConstraints(
                            maxHeight: height * 0.12,
                            maxWidth: width * 0.8,
                          ),
                          child: ElevatedButton(
                            style: ButtonStyle(
                              backgroundColor: MaterialStateColor.resolveWith(
                                      (states) => kBlueColor),
                              shape: MaterialStateProperty.all<
                                  RoundedRectangleBorder>(
                                RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(18.0),
                                ),
                              ),
                            ),
                            onPressed: () {
setState(() {
  statuscode=100;
}); getSubmit();



                            },
                            child: Text(
                              "Submit",
                              style: TextStyle(color: Colors.white, fontSize: 18),
                            ),
                          ),
                        ),
                      ),
                    ]
                )
            ),
          ),
        ),
          Container(
              child: statuscode == 100
                  ? AlertDialog(
                insetPadding:
                EdgeInsets.symmetric(horizontal: 2.0, vertical: 2.0),
                content: Container(
                  height: 100,
                  width: MediaQuery.of(context).size.width * 0.2,
                  child: SpinKitCubeGrid(
                    color: kBlueColor,
                  ),
                ),
              )
                  : Container())
        ] ),


    );
  }
}

Widget customTextfield(BuildContext context, TextEditingController controller,
    String labelText, bool enable,var type) {
  return Padding(
    padding: EdgeInsets.symmetric(vertical: 8),
    child: TextFormField(
      textCapitalization: TextCapitalization.words,
      controller: controller,
      keyboardType: type,
enabled: enable,
      decoration: InputDecoration(
        border: OutlineInputBorder(),
        contentPadding: EdgeInsets.only(top: 15, bottom: 6, left: 10),

        labelText: labelText,
        labelStyle: TextStyle(
          color: kBlueColor,
        ),
      ),
    ),
  );
}

