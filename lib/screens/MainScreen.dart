import 'package:convex_bottom_bar/convex_bottom_bar.dart';
import 'package:flutter/material.dart';
import 'package:immigration/constants.dart';
import 'package:immigration/listscreens/postListScreen.dart';
import 'package:immigration/screens/Home_page.dart';
import 'package:immigration/screens/Post_detals.dart';
import 'package:immigration/screens/addPostScreen.dart';

import 'Login.dart';
import 'ProfileScreen.dart';
class MainScreen extends StatefulWidget {
  const MainScreen({Key? key}) : super(key: key);

  @override
  _MainScreenState createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  int selecttap=0;
  static List<Widget> widgetList=<Widget>[
    HomePage(),
    PostDetails("XosbdVvwzsvnRII7DUoO"),
    AddPost(),
    PostListScreen(uri: "https://frozen-savannah-16893.herokuapp.com/User/favoritelist/hfk"),
    ProfileScreen(),


  ];
  //bool
  void _onselecte(int index){
    setState((){
      selecttap=index;
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [

          IconButton(onPressed: null, icon: Icon(Icons.search,color: kBlueColor,
          )), IconButton(onPressed: null, icon: Icon(Icons.notifications_active,color: kBlueColor,
          )),
        ],
        leading: Image.asset("assets/images/logo.png"),
        backgroundColor: Colors.white,
        title: Text("Immigration Adda",
          style: TextStyle(color: kBlueColor),),

      ),
      bottomNavigationBar: ConvexAppBar(
        style: TabStyle.fixedCircle,
        backgroundColor: Colors.white,
        activeColor: kBlueColor,
        color: Colors.black38,
        onTap:_onselecte,
        items: [
          TabItem(icon: Icons.home, title: 'Home'),
          TabItem(icon: Icons.message, title: 'Message'),
          TabItem(icon: Icons.add, title: 'Add'),
          TabItem(icon: Icons.favorite, title: 'Favorite'),
          TabItem(icon: Icons.people, title: 'Profile'),
        ],
      ),
      body: widgetList.elementAt(selecttap),
    );
  }
}

