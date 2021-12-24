import 'package:fluttertoast/fluttertoast.dart';
import 'package:flutter/material.dart';
import 'package:immigration/matrimonial/Screens/Plans/plans.dart';

GlobalKey globalKey = GlobalKey();


class planToast extends StatefulWidget {
  @override
  _planToastState createState() => _planToastState();
}

class _planToastState extends State<planToast> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: globalKey,
      appBar: AppBar(
        title: Text("Toast"),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          ElevatedButton(
            onPressed: () {
              Navigator.of(context).push(MaterialPageRoute(
                builder: (context) => Plans(),
              ));
            },
            child: Text("Flutter Toast No Context"),
          ),
          SizedBox(
            height: 24.0,
          ),
          ElevatedButton(
            onPressed: () {
              Navigator.of(context).push(MaterialPageRoute(
                builder: (context) => Plans(),
              ));
            },
            child: Text("Flutter Toast Context"),
          ),
        ],
      ),
    );
  }
}