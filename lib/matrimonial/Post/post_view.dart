import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:immigration/matrimonial/Api/api_config.dart';
import 'package:immigration/matrimonial/ChatData/image_upload.dart';
import 'package:immigration/matrimonial/ChatData/upload_profile_pic.dart';
import 'package:immigration/matrimonial/Screens/personal_info.dart';

class PostView extends StatefulWidget {
  const PostView({Key? key}) : super(key: key);

  @override
  _PostViewState createState() => _PostViewState();

}

class _PostViewState extends State<PostView> {
  // int? statusCode=0;
  // bool isDocExists = false;
  // int profileCount =0;
  // String? imgUrl= "";
  // int? planId;
  // int check =0;
  // FirebaseFirestore db = FirebaseFirestore.instance;
  // Future<int> userIdCheck() async{
  //   await db.collection("userPlan").doc("12345").get().then((value) async {
  //
  //     await db.collection("matrimonial").doc("12345").get().then((v){
  //       setState(() {
  //         planId= v.data()!["planId"];
  //         log("---------plan----$planId-----");
  //
  //       });
  //     });
  //     setState(() {
  //       isDocExists =value.exists;
  //       log("-----existxs--------$isDocExists-----");
  //       profileCount=  value.data()!["profileCount"];
  //       log("----count---------$profileCount-----");
  //
  //     });
  //
  //   });
  //   if(isDocExists== true && planId==0){
  //     log("-----1st");
  //     setState(() {
  //       check =1;
  //     });
  //     Fluttertoast.showToast(msg: "Please update your plan!");
  //
  //   }else if(isDocExists== true && planId ==1 ){
  //     log("-----2t");
  //     setState(() {
  //       check =1;
  //     });
  //     log("-check value-2---$check");
  //     if(profileCount ==2){
  //       Fluttertoast.showToast(msg: "Please update your plan!");
  //       showAboutDialog(context:context,children: [
  //         Center(child: Text("Error Happen!")),
  //         Text("To upload image please upgrade your plan!"),
  //
  //       ]);
  //     }
  //   }
  //   else if(isDocExists== true && planId ==2 ){
  //     log("-0-------3");
  //     setState(() {
  //       check =1;
  //     });
  //     if(profileCount ==5){
  //       showAboutDialog(context:context,children: [
  //         Center(child: Text("Error Happen!")),
  //         Text("To upload image please upgrade your plan!"),
  //
  //       ]);
  //     }
  //     getImage().then((value) {
  //       uploadImage();
  //     });
  //
  //   }
  //   else if(isDocExists== false ){
  //     log("----------------4");
  //     getImage().then((value) {
  //       uploadImage();
  //     });
  //     db.collection("userPlan").doc("12345").update({"profileCount":1,"uid":"12345"}).whenComplete(() => log("Added image"));
  //   }
  //   return check;
  // }
  // // Future getImage() async {
  // //   final pickedFile =
  // //   await picker.getImage(source: ImageSource.gallery, imageQuality: 50);
  // //
  // //   setState(() {
  // //     if (pickedFile != null) {
  // //       image = File(pickedFile.path);
  // //     } else {
  // //       print("profile view!");
  // //     }
  // //   });
  // // }
  // Dio dio = Dio();
  // uploadImage() async {
  //   setState(() {
  //     statusCode = 100;
  //   });
  //   String fileName = image!.path.split('.').last;
  //   print(fileName);
  //   FormData formData = FormData.fromMap({
  //     "file": await MultipartFile.fromFile(image!.path,
  //         contentType: MediaType("image", fileName))
  //   });
  //   return await dio
  //       .postUri(Uri.parse(ApiConfig.BASE_URL + "User/upload"), data: formData)
  //       .then((value) {
  //     // if (response!.statusCode != 200) {
  //     //
  //     // }
  //
  //     if (value.statusCode == 200) {
  //       print("Image Uploaded");
  //       print(value.data);
  //       setState(() {
  //         statusCode = value.statusCode;
  //         imgUrl = value.data;
  //       });
  //
  //       db.collection("userPlan").doc("12345").update({"profileCount":profileCount+1}).whenComplete(() => log("image Count ++ success"));
  //     }
  //   });
  // }
  @override
  Widget build(BuildContext context) {
    return FutureBuilder<Object>(
        future: null,
        builder: (context, snapshot) {
          return ListView.builder(
            shrinkWrap: true,
            physics: NeverScrollableScrollPhysics(),
            itemCount: 5,
            itemBuilder: (BuildContext context, int index) {
              return Padding(
                padding: const EdgeInsets.all(4.0),
                child: Container(
                  height: MediaQuery.of(context).size.height / 1.2,
                  child: Card(
                    elevation: 8,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: GestureDetector(
                      onTap: () {
                        Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(
                            builder: (context) =>
                                UploadProfilePic (),
                          ),
                        );
                      },
                      child: Column(
                        children: [
                          Stack(
                            children: [
                              Container(
                                width: MediaQuery.of(context).size.width,
                                height: MediaQuery.of(context).size.height / 1.6,
                                child: Card(
                                  margin: EdgeInsets.zero,
                                  elevation: 8,
                                  shape: const RoundedRectangleBorder(
                                    borderRadius: BorderRadius.only(
                                      topRight: Radius.circular(20),
                                      topLeft: Radius.circular(20),
                                    ),
                                  ),
                                  clipBehavior: Clip.antiAliasWithSaveLayer,
                                  child:Image.asset(
                                    'Images/girl.png',
                                    fit: BoxFit.cover,
                                  ),



                                ),
                              ),
                              Container(
                                height: MediaQuery.of(context).size.height / 1.6,
                                alignment: Alignment.topRight,
                                width: MediaQuery.of(context).size.width,
                                child: const Padding(
                                  padding: EdgeInsets.all(8.0),
                                  child: Card(
                                      elevation: 8,
                                      shape: RoundedRectangleBorder(
                                          borderRadius: BorderRadius.all(
                                              Radius.circular(26))),
                                      child: Padding(
                                        padding: EdgeInsets.all(5.0),
                                        child: Icon(Icons.favorite_border_outlined,
                                            color: Colors.red, size: 30),
                                      )),
                                ),
                              ),
                              Row(
                                children: [
                                  Container(
                                    height:
                                        MediaQuery.of(context).size.height / 1.6,
                                    alignment: Alignment.bottomLeft,
                                    child: const Padding(
                                      padding: EdgeInsets.all(8.0),
                                      child: Text(
                                        'Mishika',
                                        style: TextStyle(
                                            backgroundColor: Colors.black12,
                                            color: Colors.white,
                                            fontSize: 28,
                                            fontWeight: FontWeight.bold),
                                      ),
                                    ),
                                  ),
                                  Container(
                                    height:
                                        MediaQuery.of(context).size.height / 1.7,
                                    alignment: Alignment.bottomLeft,
                                    child: const ImageIcon(
                                      AssetImage('Images/Icons/kingcrown1.png'),
                                      color: Colors.orange,
                                      size: 40,
                                    ),
                                  ),
                                  Container(
                                    height: MediaQuery.of(context).size.height / 1.7,
                                    width: MediaQuery.of(context).size.width / 2.0,
                                    alignment: Alignment.bottomRight,
                                    child: const ImageIcon(
                                      AssetImage('Images/Icons/MarriagePalace.png'),
                                      color: Colors.orange,
                                      size: 40,
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                          Padding(
                            padding: const EdgeInsets.only(left: 10, top: 4),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: const [
                                Text(
                                  '30 Years',
                                  style: TextStyle(
                                      color: Colors.red,
                                      fontSize: 17,
                                      fontWeight: FontWeight.bold),
                                ),
                                SizedBox(width: 20),
                                Text(
                                  '5.6"',
                                  style: TextStyle(
                                      color: Colors.blue,
                                      fontSize: 17,
                                      fontWeight: FontWeight.bold),
                                ),
                                SizedBox(width: 20),
                                Text(
                                  'Soni',
                                  style: TextStyle(
                                      color: Colors.purple,
                                      fontSize: 17,
                                      fontWeight: FontWeight.bold),
                                ),
                                SizedBox(width: 20),
                                Text(
                                  'Rajpura',
                                  style: TextStyle(
                                      color: Colors.green,
                                      fontSize: 17,
                                      fontWeight: FontWeight.bold),
                                ),
                              ],
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(left: 10, top: 4),
                            child: Container(
                              alignment: Alignment.centerLeft,
                              child: Row(
                                children: const [
                                  Text(
                                    'IELTS/TOFEL -',
                                    style: TextStyle(
                                        color: Colors.blue,
                                        fontSize: 17,
                                        fontWeight: FontWeight.bold),
                                  ),
                                  Text(
                                    ' 7.5 Bands',
                                    style: TextStyle(
                                        color: Colors.pink,
                                        fontSize: 17,
                                        fontWeight: FontWeight.bold),
                                  ),
                                ],
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(left: 10, top: 4),
                            child: Container(
                              alignment: Alignment.centerLeft,
                              child: Wrap(
                                children: const [
                                  Text(
                                    'Interested for - ',
                                    style: TextStyle(
                                        color: Colors.teal,
                                        fontSize: 17,
                                        fontWeight: FontWeight.bold),
                                  ),
                                  Text(
                                    'Canada, U.S.A, Russia, Fizi, \n Australia, New Zealand',
                                    style: TextStyle(
                                        color: Colors.purple,
                                        fontSize: 17,
                                        fontWeight: FontWeight.bold),
                                  ),
                                ],
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(8),
                            child: Container(
                              height: 20, width: 200,
                              //color: Color(0xff0d47a1),
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(20)),
                              child: ElevatedButton(
                                style: ButtonStyle(
                                  backgroundColor: MaterialStateColor.resolveWith(
                                        (states) => const Color(0xffff5275),
                                  ),
                                  shape:
                                  MaterialStateProperty.all<RoundedRectangleBorder>(
                                    RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(40.0),
                                    ),
                                  ),
                                ),
                                onPressed: () {
                                  setState(() {

                                  });
                                  },
                                child: const Text(
                                  "View Profile",
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
                  ),

                ),
              );
            },
          );
        });
  }
}
