import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:immigration/matrimonial/Screens/about_yourself.dart';
import 'package:immigration/matrimonial/Screens/contact_info.dart';
import 'package:immigration/matrimonial/Screens/ilets_tofel_celpip.dart';
import 'package:immigration/matrimonial/Screens/welcome_screen.dart';

class MarriageIntereste extends StatefulWidget {
  const MarriageIntereste({Key? key}) : super(key: key);

  @override
  _MarriageInteresteState createState() => _MarriageInteresteState();
}

class _MarriageInteresteState extends State<MarriageIntereste> {

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
            MaterialPageRoute(builder: (context) => const IletsTofelCelpip()),
          );},
        ),
        title:  TextButton(onPressed: (){ Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (context) => const WelcomeScreen()),
        );},
            child: const Center(
              child: Text('Immigration Adda',
                style:  TextStyle(
                    fontSize: 18,
                    color: Colors.white
                ),),
            )),
      ),
      body: Stack(
        children: [
          SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                children:  [
                  const Text('Where Interested to Marriage',
                    style: TextStyle(
                        color: Colors.black,
                        fontSize: 20,
                        fontWeight: FontWeight.bold
                    ),
                  ),
                  const Padding(
                    padding: EdgeInsets.all(2.0),
                    child: TextField(
                      style: TextStyle(
                        color: Color(0xff00235a),
                      ),
                      decoration:  InputDecoration(
                        border: UnderlineInputBorder(),
                        labelText: 'Country Name :-',
                        labelStyle: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: Color(0xffff5275),
                            fontSize: 18
                        ),
                      ),
                    ),
                  ),
                  const Padding(
                    padding: EdgeInsets.all(2.0),
                    child: TextField(
                      style: TextStyle(
                        color: Color(0xff00235a),
                      ),
                      decoration:  InputDecoration(
                        border: UnderlineInputBorder(),
                        labelText: 'City Name :-',
                        labelStyle: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: Color(0xffff5275),
                            fontSize: 18
                        ),
                      ),
                    ),
                  ),
                  const Padding(
                    padding: EdgeInsets.all(2.0),
                    child: TextField(
                      style: TextStyle(
                        color: Color(0xff00235a),
                      ),
                      decoration:  InputDecoration(
                        border: UnderlineInputBorder(),
                        labelText: 'Interested to Marriage with :-',
                        labelStyle: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: Color(0xffff5275),
                            fontSize: 18
                        ),
                      ),
                    ),
                  ),
                  const Padding(
                    padding: EdgeInsets.all(2.0),
                    child: TextField(
                      style: TextStyle(
                        color: Color(0xff00235a),
                      ),
                      decoration:  InputDecoration(
                        border: UnderlineInputBorder(),
                        labelText: 'Living Status :-',
                        labelStyle: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: Color(0xffff5275),
                            fontSize: 18
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8),
                    child: Container(
                      height: 50, width: 280,
                      //color: Color(0xff0d47a1),
                      decoration:
                      BoxDecoration(borderRadius: BorderRadius.circular(20)),
                      child: ElevatedButton(
                        style: ButtonStyle(
                          backgroundColor: MaterialStateColor.resolveWith(
                                (states) => const Color(0xffff5275),
                          ),
                          shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                            RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(40.0),
                            ),
                          ),
                        ),
                        onPressed: () {
                          Navigator.pushReplacement(
                            context,
                            MaterialPageRoute(builder: (context) => const ContactInfo()),
                          );
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
          ),
        ],
      ),
    );
  }
}
