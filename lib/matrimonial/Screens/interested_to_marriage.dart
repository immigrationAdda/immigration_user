import 'dart:ui';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:immigration/matrimonial/ChatData/masseges.dart';
import 'package:immigration/matrimonial/Constants/const.dart';
import 'package:immigration/matrimonial/Data/post_function.dart';
import 'package:immigration/matrimonial/Screens/about_yourself.dart';
import 'package:immigration/matrimonial/Screens/abroad.dart';
import 'package:immigration/matrimonial/Screens/contact_info.dart';
import 'package:immigration/matrimonial/Screens/ilets_tofel_celpip.dart';
import 'package:immigration/matrimonial/Screens/partner_prefrence.dart';
import 'package:immigration/matrimonial/Screens/welcome_screen.dart';

class InterestedToMarriage extends StatefulWidget {
  const

  InterestedToMarriage({Key? key}) : super(key: key);

  @override
  _InterestedToMarriageState createState() => _InterestedToMarriageState();
}

class _InterestedToMarriageState extends State<InterestedToMarriage> {
  final PostFunction _postFunction = PostFunction();
  Dio dio = Dio();

  List<String> selectedCountries=[];
  List <String>? marriagewith =['NRI','Indian ','Foreigner','Dose not matter'];
  List <String>? livingstatus =['Citizenship','Work permit','Study visa','PR','Dose not matter'];

  List<String>? countries= ['Canada','USA','Australia','New Zealand','U.K','Germany','France','Italy','Norway',
    'Russia','Austria','Portugal','China','Japan','Pakistan','Saudi arab','UAE','Singapore','Malaysia','Fizi','Brazil',
    'Argentina','Europe','A Gulf Countries','Asia','Africa','South America',
    'Nepal','Sri Lanka','Other'];


  TextEditingController wantMarriageCityNameController = TextEditingController();




  uploadData() async {
    _postFunction.postMarriageInterest({
       "mId": '0123',
      "wantMarriageCountryName": selectedCountries,
      "wantMarriageCityName": wantMarriageCityNameController.text,
      "interestedToMarriageWith": selectedMarriageWith,
      "livingStatus": selectedLivingStatus,
    });
  }

  String? selectedCoutries;
  String selectedLivingStatus = '';
  String selectedMarriageWith = '';


  String? selectedValue;
  bool isSubmitted=false;

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xffff5275),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          tooltip: "Cancel and Return to List",
          onPressed: () {
            Navigator.pushReplacement(
              context,
              MaterialPageRoute(builder: (context) => const AbroadStatus()),
            );
          },
        ),
        title: TextButton(
            onPressed: () {
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(builder: (context) => const AbroadStatus()),
              );
            },
            child: const Center(
              child: Text(
                'Immigration Adda',
                style: TextStyle(fontSize: 18, color: Colors.white),
              ),
            )),
      ),
      body: Stack(
        children: [
          SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                children: [
                  const Text(
                    'Where do you want to marriage',
                    style: TextStyle(
                        color: Colors.black,
                        fontSize: 20,
                        fontWeight: FontWeight.bold),
                  ),
                  SizedBox(
                    width: double.infinity,
                    child: Card(
                      shape: RoundedRectangleBorder(
                          side: BorderSide(color: Colors.grey, width: 0.3),
                          borderRadius: BorderRadius.circular(3)),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Padding(
                            padding: EdgeInsets.only(top: 8.0, left: 8),
                            child: Text(
                              'Preferred Country Name',
                              style: TextStyle(
                                color: kRedColor,
                                fontSize: 18,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                          Wrap(
                            children: countries!
                                .map((e) => InkWell(
                                onTap: () {
                                  var object = "I LIKE JAVA";
                                  if(selectedCountries.contains(e)){

                                    setState(() {
                                      selectedCountries.removeWhere((element) => element ==e);
                                    });
                                    print(selectedCountries);

                                  }else{
                                    setState(() {
                                      selectedCountries.add(e);
                                      //   selectedWheeler = e! as List<String>;
                                    });
                                    print(selectedCountries);
                                  }},
                                child: Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Container(
                                      width: 90.0,
                                      padding: const EdgeInsets.all(4.0),
                                      alignment: Alignment.center,
                                      decoration: BoxDecoration(
                                        borderRadius:
                                        BorderRadius.circular(8.0),
                                        border: Border.all(
                                            width: 0.7, color: Colors.grey),
                                        color: (selectedCountries.contains(e)==true)
                                            ? kRedColor
                                            : Colors.white,
                                      ),
                                      child: Padding(
                                        padding: const EdgeInsets.all(4.0),
                                        child: Text(e,
                                            style: TextStyle(
                                                color: (selectedCountries.contains(e)==true)
                                                    ? Colors.white
                                                    : Colors.black)),
                                      )),
                                )))
                                .toList(),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: CustomeTextField(isSubmitted: isSubmitted, context: context, controller: wantMarriageCityNameController, labelText: 'Preferred City Name   '),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: SizedBox(

                      width: double.infinity,
                      child: Card(

                         shape: RoundedRectangleBorder(side: BorderSide(color: Colors.grey, width: 0.3),borderRadius: BorderRadius.circular(3)),
                        //color: Colors.grey.shade200,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Padding(
                              padding: EdgeInsets.only(top: 8.0, left: 8),
                              child: Text(
                                'Preferred match for marriage ',
                                style: TextStyle(
                                  color: kRedColor,
                                  fontSize: 18,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                            Wrap(
                              children: marriagewith!
                                  .map((e) => InkWell(
                                  onTap: () {
                                    var object = "I LIKE JAVA";

                                    setState(() {
                                      selectedMarriageWith = e;
                                    });
                                    print(selectedMarriageWith);
                                  },
                                  child: Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Container(
                                        width: 90.0,
                                        padding: const EdgeInsets.all(4.0),
                                        alignment: Alignment.center,
                                        decoration: BoxDecoration(
                                          borderRadius:
                                          BorderRadius.circular(8.0),
                                          border: Border.all(
                                              width: 0.7, color: Colors.grey),
                                          color: (e == selectedMarriageWith)
                                              ? kRedColor
                                              : Colors.white,
                                        ),
                                        child: Padding(
                                          padding: const EdgeInsets.all(4.0),
                                          child: Text(e,
                                              style: TextStyle(
                                                  color: (e == selectedMarriageWith)
                                                      ? Colors.white
                                                      : Colors.black)),
                                        )),
                                  )))
                                  .toList(),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),

                  //CustomeTextField(isSubmitted: isSubmitted, context: context, controller: interestedToMarriageWithController, labelText: 'Interested to Marriage with   '),
                 // CustomeTextField(isSubmitted: isSubmitted, context: context, controller: livingStatusController, labelText: 'Living Status   '),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: SizedBox(
                      width: double.infinity,
                      child: Card(

                         shape: RoundedRectangleBorder(side: BorderSide(color: Colors.grey, width: 0.3),borderRadius: BorderRadius.circular(3)),
                        //color: Colors.grey.shade200,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Padding(
                              padding: EdgeInsets.only(top: 8.0, left: 8),
                              child: Text(
                                'Preferred living status of Spouse',
                                style: TextStyle(
                                  color: kRedColor,
                                  fontSize: 18,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                            Wrap(
                              children: livingstatus!
                                  .map((e) => InkWell(
                                  onTap: () {
                                    var object = "I LIKE JAVA";

                                    setState(() {
                                      selectedLivingStatus = e;
                                    });
                                    print(selectedLivingStatus);
                                  },
                                  child: Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Container(
                                        width: 100.0,
                                        padding: const EdgeInsets.all(4.0),
                                        alignment: Alignment.center,
                                        decoration: BoxDecoration(
                                          borderRadius:
                                          BorderRadius.circular(8.0),
                                          border: Border.all(
                                              width: 0.7, color: Colors.grey),
                                          color: (e == selectedLivingStatus)
                                              ? kRedColor
                                              : Colors.white,
                                        ),
                                        child: Padding(
                                          padding: const EdgeInsets.all(4.0),
                                          child: Text(e,
                                              style: TextStyle(
                                                  color: (e == selectedLivingStatus)
                                                     ? Colors.white
                                                      : Colors.black)),
                                        )),
                                  )))
                                  .toList(),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),


                  Padding(
                    padding: const EdgeInsets.all(8),
                    child: Container(
                      height: 50, width: 280,
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
                            isSubmitted= true;
                          });
                          if (selectedLivingStatus== null) {
                            print('Living Status');
                          } else if (selectedMarriageWith== null) {
                            print('Interested to Marriage with');
                          } else if (wantMarriageCityNameController
                                  .text.isEmpty ||
                              wantMarriageCityNameController.text.length < 3) {
                            print('City name you want');
                          } else if (selectedCountries== null){
                            print('Country Name want');
                          } else {
                            print("start -----------------------");
                            uploadData();
                            Navigator.pushReplacement(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => const PartnerPrefrence()),
                            );
                          }
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

class CustomeTextField extends StatelessWidget {
  const CustomeTextField({
    Key? key,
    required this.isSubmitted,
    required this.context,
    required this.controller,
    required this.labelText, this.words,
  }) : super(key: key);

  final bool isSubmitted;
  final BuildContext context;
  final TextEditingController? controller;
  final TextCapitalization? words;
  final String? labelText;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(2.0),
      child: TextField(
        style: const TextStyle(
          color: Color(0xff00235a),
        ),
        textCapitalization: TextCapitalization.words,
        controller: controller,
        decoration: InputDecoration(
          errorText: (isSubmitted == true && controller!.text.isEmpty) ? "Please fill field":null,
          suffixIcon: (isSubmitted == true && controller!.text.isEmpty)?  const Icon(Icons.error_outline): null,
          border:  const OutlineInputBorder(
              borderSide: BorderSide(color: Colors.grey)),
          enabledBorder:  const OutlineInputBorder(
              borderSide: BorderSide(color: Colors.grey)),
          focusedBorder: const OutlineInputBorder(
              borderSide: BorderSide(color: Colors.redAccent)),
          labelText: labelText,
          labelStyle: const TextStyle(
            fontWeight: FontWeight.bold,
            color: Color(0xffff5275),
            fontSize: 18,
          ),
        ),
      ),
    );
  }
}
