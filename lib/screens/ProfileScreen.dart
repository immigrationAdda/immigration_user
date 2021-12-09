import 'dart:convert';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:immigration/Models/UserModel.dart';
import 'package:immigration/SizeConfig.dart';
import 'package:immigration/constants.dart';
import 'package:immigration/postCreateScreens/MyPostScreen.dart';
import 'package:immigration/screens/UserProfileDetails.dart';
import 'package:http/http.dart' as http;
import 'package:share/share.dart';
class ProfileScreen extends StatefulWidget {
  const ProfileScreen({Key? key}) : super(key: key);

  @override
  _ProfileScreenState createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
 Future<UserModel> getData() async {
  var res=await http.get(Uri.parse("https://frozen-savannah-16893.herokuapp.com/User/getdata/hfk"));
  Map<String,dynamic> result=json.decode(res.body);
  if(res.statusCode==200){
    print("///"+result.toString());}else{
    print("not"+res.statusCode.toString());
  }
  UserModel userModel=UserModel.fromJson(result);
  setState(() {
    userDetails=userModel;
  });
 return userModel;
}
var getDataUser;
 late UserModel userDetails;
  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Container(

      child: FutureBuilder(
        future: getDataUser,
        builder: (context, snapshot) {
          if(snapshot.connectionState==ConnectionState.waiting){
            return Center(child: CircularProgressIndicator());
          }
          if(snapshot.connectionState==ConnectionState.done){
          return Column(
            children: [
              Container(
                  height: SizeConfig.safeBlockHorizontal!*40,
                  width: SizeConfig.safeBlockHorizontal!*40,
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Card(

                    shape: RoundedRectangleBorder(
                      side: BorderSide(color: Colors.black12, width: 1),
                      borderRadius: BorderRadius.circular(100),
                    ),
                      child: CircleAvatar(
                        radius: 60.0,
                        backgroundImage: NetworkImage(userDetails.profilePicture),
                      ),
                    ),
                  )

              ),
              Container(
                width: SizeConfig.safeBlockHorizontal!*100,
                alignment: Alignment.center,
                child: Text(userDetails.name),
              ),
              GestureDetector(
                  onTap: () {
                    Navigator.of(context).push(MaterialPageRoute(builder: (cont)=>
                        UserProfile(uId:FirebaseAuth.instance.currentUser!.uid)
                    ));

                  },
                  child: textButton(context, "Profile", Icons.person)),
              GestureDetector(
                  onTap: () {
                    Navigator.of(context).push(MaterialPageRoute(
                        builder: (context) =>
                            MyPostScreen()));
                  },
                  child:
                      textButton(context, "My Post", Icons.widgets_rounded)),


              GestureDetector(
                  onTap: () {
                    Share.share("https://play.google.com/store/apps/details?id=com.immigrationadda.user",

                        );
                  },
                  child:
                      textButton(context, "Invite Friends", Icons.share_outlined)),
             GestureDetector(
                  onTap: () {},
                  child:
                      textButton(context, "Help and Support", Icons.help_outline)),
              GestureDetector(
                  onTap: () {},
                  child: textButton(context, "Privacy Policy", Icons.privacy_tip_outlined)),
              GestureDetector(
                  onTap: () {},
                  child: textButton(context, "Log Out", Icons.logout_outlined)),
            ],
          );}
          return CircularProgressIndicator();

        }
      ),
    );
  }

@override
  void initState() {
    getDataUser=getData();
  }
}

Widget textButton(BuildContext buildContext, String title, IconData iconData) {
  return Container(
    height: SizeConfig.safeBlockHorizontal! * 15,
    child: Card(
      child: Row(
        children: <Widget>[
          Expanded(
              flex: 2,
              child: Icon(
                iconData,
                size: SizeConfig.safeBlockHorizontal! * 8,color: kBlueColor,
              )),
          Expanded(
              flex: 8,
              child: Text(
                title,
                style: TextStyle(fontSize: SizeConfig.safeBlockHorizontal! * 5,
                color: kBlueColor),
              )),
          Expanded(flex: 2, child: Icon(Icons.navigate_next_outlined,color: kBlueColor,)),
        ],
      ),
    ),
  );
}
