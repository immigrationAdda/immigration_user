import 'dart:async';

import 'package:flutter/material.dart';
import 'package:immigration/login/login_screen.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  void initState() {
    super.initState();
    Timer(Duration(seconds: 3), () {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (context) => LoginScreen(),
        ),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Stack(
      children: [
        Image.asset("assets/images/topdesign.png"),
        Align(
            alignment: Alignment.center,
            child: Padding(
              padding: const EdgeInsets.all(74.0),
              child: Image.asset("assets/images/logo.png"),
            )),
        Align(
            alignment: Alignment.bottomCenter,
            child: Image.asset("assets/images/bottomdesign.png")),
      ],
    ));
  }
}
