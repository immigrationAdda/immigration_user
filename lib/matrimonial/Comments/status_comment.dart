import 'package:flutter/material.dart';
import 'package:immigration/matrimonial/ChatData/chart_list.dart';
import 'package:immigration/matrimonial/Screens/personal_info.dart';

class StatusComments extends StatefulWidget {
  const StatusComments({Key? key}) : super(key: key);

  @override
  _StatusCommentsState createState() => _StatusCommentsState();
}

class _StatusCommentsState extends State<StatusComments> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xffff5275),
        leading: IconButton(icon: const Icon(Icons.arrow_back),
          tooltip: "Cancel and Return to List",
          onPressed: () { Navigator.pushReplacement(
            context,
            MaterialPageRoute(builder: (context) => const Status()),
          );},
        ),
        title: const Center(
          child: Text('Immigration Adda',
            style: TextStyle(fontSize: 18),
          ),
        ),
      ),
      body: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [

            Container(
              alignment: Alignment.topLeft,
              child: const Padding(
                padding: EdgeInsets.all(8.0),
                child: Center(
                  child: Text(
                    "Add comments",
                    style: TextStyle(
                      color: Colors.redAccent,
                      fontSize: 18,
                    ),
                  ),
                ),
              ),
            ),
            const Padding(
              padding:  EdgeInsets.all(2.0),
              child: TextField(
                maxLines: 7,
                style: TextStyle(
                  color: Color(0xff00235a),
                ),
                decoration:  InputDecoration(
                  border: UnderlineInputBorder(),
                ),
              ),
            ),
            const SizedBox(height:90),
            Padding(
              padding: const EdgeInsets.all(16),
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
                      MaterialPageRoute(builder: (context) =>  Status()),
                    );
                  },
                  child: const Text(
                    "Upload",
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
    );
  }
}
