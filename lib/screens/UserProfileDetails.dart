import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:immigration/Models/UserModel.dart';
import 'package:immigration/constants.dart';
import 'package:http/http.dart' as http;

class UserProfile extends StatefulWidget {
  const UserProfile({Key? key}) : super(key: key);

  @override
  _UserProfileState createState() => _UserProfileState();
}

class _UserProfileState extends State<UserProfile> {
  Future<UserModel> getdata() async {
     var res=await http.get(Uri.parse("https://frozen-savannah-16893.herokuapp.com/User/getdata/hfk"));
   var obj=json.decode(res.body);
   UserModel userModel=UserModel.fromJson(obj);
   return userModel;
  }

  @override
  Widget build(BuildContext context) {

    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(onPressed: null, icon: Icon(Icons.search,color: kBlueColor,
          ))
        ],
        leading: Image.asset("assets/images/logo.png"),
        backgroundColor: Colors.white,
        title: Text("Immigration Adda",
          style: TextStyle(color: kBlueColor),),
      ),
        body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding:  EdgeInsets.symmetric(vertical: 10,horizontal: 24),
            child:
            FutureBuilder<UserModel>(
              future: getdata(),
              builder: (BuildContext context, AsyncSnapshot<UserModel> userModel) {
              return Column(
                        children: [
                           Center(
                            child: CircleAvatar(
                              radius: 70,
                              backgroundColor: Colors.grey,
                              backgroundImage:NetworkImage(userModel.data!.profilePicture)
                            ),
                          ),
                          Padding(
                            padding:  EdgeInsets.all(2.0),
                            child: TextFormField(
                              enabled: false,
                              initialValue: userModel.data!.name,
                              style:  TextStyle(
                                color: Colors.black
                                ),
                              decoration:  InputDecoration(
                                  border: UnderlineInputBorder(),
                                  labelText: 'Name',
                              labelStyle: TextStyle(
                                color:kBlueColor,
                              ),
                              ),
                            ),
                          ),
                          Padding(
                            padding:  EdgeInsets.all(2.0),
                            child: TextFormField(
                              enabled: false,
                              initialValue: userModel.data!.phoneNo,
                              decoration:  InputDecoration(
                                counterText: "",
                                border: UnderlineInputBorder(),
                                labelText: 'Phone no.',
                                labelStyle: TextStyle(
                                  color:kBlueColor,
                                ),
                              ),
                              maxLength: 10,
                            ),
                          ),
                          Padding(
                            padding:  EdgeInsets.all(2.0),
                            child: TextFormField(
                              enabled: false,
                              initialValue: userModel.data!.email,
                              decoration:  InputDecoration(
                                border: UnderlineInputBorder(),
                                labelText: 'Email ID',
                                labelStyle: TextStyle(
                                  color:kBlueColor,
                                ),
                              ),
                            ),
                          ),

                          Padding(
                            padding:  EdgeInsets.all(2.0),
                            child: TextFormField(
                              enabled: false,
                              initialValue: '27/05/1999',
                              decoration:  InputDecoration(
                                border: UnderlineInputBorder(),
                                labelText: 'Date Of Birth',
                                labelStyle: TextStyle(
                                  color:kBlueColor,
                                ),
                              ),
                            ),
                          ),
                          Padding(
                            padding:  EdgeInsets.all(2.0),
                            child: TextFormField(
                              enabled: false,
                              initialValue: 'Chandigarh',
                              decoration:  InputDecoration(
                                border: UnderlineInputBorder(),
                                labelText: 'City',
                                labelStyle: TextStyle(
                                  color:kBlueColor,
                                ),
                              ),
                            ),
                          ),

                           SizedBox(height: 30),
                          Padding(
                            padding:  EdgeInsets.symmetric(horizontal: 83.0),
                            child: ConstrainedBox(
                              constraints: BoxConstraints(
                                maxHeight: height * 0.12,
                                maxWidth: width * 0.8,
                              ),
                              child: ElevatedButton(
                                style: ButtonStyle(
                                  backgroundColor: MaterialStateColor.resolveWith(
                                          (states) => kBlueColor),
                                  shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                                    RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(18.0),
                                    ),
                                  ),
                                ),
                                onPressed: () {},
                                child:  Text(
                                  "Submit",
                                  style: TextStyle(color: Colors.white, fontSize: 18),
                                ),
                              ),
                            ),
                          ),
                ]
                  ); },
            ),
          ),
          ),
        ),

    );
  }
}

