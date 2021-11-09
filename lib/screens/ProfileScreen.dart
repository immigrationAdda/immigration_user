import 'package:flutter/material.dart';
import 'package:immigration/SizeConfig.dart';
import 'package:immigration/constants.dart';
import 'package:immigration/screens/UserProfileDetails.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({Key? key}) : super(key: key);

  @override
  _ProfileScreenState createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Container(
      child: Column(
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
                    backgroundImage: NetworkImage("https://www.orissapost.com/wp-content/uploads/2020/06/carryminati-1024x576.jpg"),
                  ),
                ),
              )

          ),
          Container(
            width: SizeConfig.safeBlockHorizontal!*100,
            alignment: Alignment.center,
            child: Text("Name"),
          ),
          GestureDetector(
              onTap: () {
                Navigator.of(context).push(MaterialPageRoute(builder: (cont)=>
                  UserProfile()
                ));

              },
              child: textButton(context, "Profile", Icons.person)),
          GestureDetector(
              onTap: () {},
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
      ),
    );
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
