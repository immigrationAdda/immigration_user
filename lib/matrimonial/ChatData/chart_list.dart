import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:immigration/matrimonial/ChatData/masseges.dart';
import 'package:immigration/matrimonial/ChatData/upload_profile_pic.dart';
import 'package:immigration/matrimonial/Comments/status_comment.dart';
import 'package:immigration/matrimonial/Screens/home.dart';

class Chat extends StatefulWidget {
  const Chat({Key? key}) : super(key: key);

  @override
  _ChatState createState() => _ChatState();
}

class _ChatState extends State<Chat> {
  final PageController controller = PageController(initialPage: 0);
  @override
  Widget build(BuildContext context) {
    final pageView = PageView(
      controller: controller,
      scrollDirection: Axis.horizontal,
      children: const [
        ChatList(),
        Status(),
      ],
    );

    return Scaffold(
      body: Stack(
        children: [
          pageView,
        ],
      ),
    );
}
}


class ChatList extends StatefulWidget {
  const ChatList({Key? key}) : super(key: key);
  @override
  _ChatListState createState() => _ChatListState();
}

class _ChatListState extends State<ChatList> {
  final PageController controller = PageController(initialPage: 0);
  @override
  Widget build(BuildContext context) {
  //   double height = MediaQuery.of(context).size.height;
  //   double width = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xffff5275),
        leading: IconButton(icon: const Icon(Icons.arrow_back),
          tooltip: "Cancel and Return to List",
          onPressed: () { Navigator.pushReplacement(
            context,
            MaterialPageRoute(builder: (context) => const Home()),
          );},
        ),
        title:  TextButton(onPressed: (){ Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (context) => const Home()),
        );},
            child: const Center(
              child: Text('Chat',
                style:  TextStyle(
                    fontSize: 18,
                    color: Colors.white
                ),),
            )),
      ),
      body: Stack(
        children: [
          SingleChildScrollView(
            child: ListView(
              scrollDirection: Axis.vertical,
              physics: const NeverScrollableScrollPhysics(),
              shrinkWrap: true,
              padding: const EdgeInsets.all(10),
              children: [
                Row(
                  children:  [
                    GestureDetector(
                      onTap: (){
                        Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(builder: (context) =>  UploadProfilePic()),
                        );
                      },
                      child: const Center(
                        child: CircleAvatar(
                          backgroundColor: Colors.red,
                          backgroundImage:
                              AssetImage('Images/welcome.png'),
                          radius: 25, //Text
                        ),
                      ),
                    ),
                    const SizedBox(
                      width: 5,
                    ),
                    TextButton(
                      child: const Text(
                        'Name',
                        style: TextStyle(
                            fontSize: 25, color: Colors.black),
                      ),
                      onPressed: (){
                        Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(builder: (context) =>  Masseges()),
                        );
                      },
                    ),
                  ],
                ),

              ],
            ),
          ),
        ],
      ),
    );
  }
}




class Status extends StatefulWidget {
  const Status({Key? key}) : super(key: key);

  @override
  _StatusState createState() => _StatusState();
}

class _StatusState extends State<Status> {
  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xffff5275),
        leading: IconButton(icon: const Icon(Icons.arrow_back),
          tooltip: "Cancel and Return to List",
          onPressed: () { Navigator.pushReplacement(
            context,
            MaterialPageRoute(builder: (context) => const ChatList()),
          );},
        ),
        title:  TextButton(onPressed: (){ Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (context) => const ChatList()),
        );},
            child: const Center(
              child: Text('Status',
                style:  TextStyle(
                    fontSize: 18,
                    color: Colors.white
                ),),
            )),
      ),
      body: Stack(
        children: [
          SingleChildScrollView(
            child: ListView(
              scrollDirection: Axis.vertical,
              physics: const NeverScrollableScrollPhysics(),
              shrinkWrap: true,
              padding: const EdgeInsets.all(10),
              children: [
                Row(
                  children:  [
                    const Center(
                      child: CircleAvatar(
                        backgroundColor: Colors.red,
                        backgroundImage:
                        AssetImage('Images/welcome.png'),
                        radius: 25, //Text
                      ),
                    ),
                    const SizedBox(
                      width: 5,
                    ),
                    TextButton(
                      child: const Text(
                        'Name',
                        style: TextStyle(
                            fontSize: 25, color: Colors.black),
                      ),
                      onPressed: (){
                        Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(builder: (context) =>   Masseges()),
                        );
                      },
                    ),
                  ],
                ),

              ],
            ),
          ),
        ],
      ),
    );
  }
}

