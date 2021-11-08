import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:immigration/Models/seller_profile_model.dart';
import 'package:immigration/constants.dart';
import 'package:immigration/dat/data_funcations.dart';

class Profile extends StatefulWidget {
  final String? sId;
   Profile({Key? key, this.sId}) : super(key: key);


  @override
  _ProfileState createState() => _ProfileState();
}

class _ProfileState extends State<Profile> with SingleTickerProviderStateMixin {
  TabController? _tabController;
  late DataFunction _dataFunction ;

  @override
  void initState() {
    _tabController = TabController(length: 5, vsync: this);
 _dataFunction =new DataFunction(sId:widget.sId);
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
    _tabController!.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 5,
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: kBlueColor,
          title: Text("Profile"),
        ),
        body: SingleChildScrollView(
          child: FutureBuilder(
              future: _dataFunction.getSellerProfileData(),
              builder: (context, AsyncSnapshot<SellerProfileModel?> snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return Container(
                    height: MediaQuery.of(context).size.height,
                    width: MediaQuery.of(context).size.width,
                    child: Center(
                      child: CircularProgressIndicator(
                        color: kBlueColor,
                      ),
                    ),
                  );
                } else if (snapshot.hasError) {
                  return Center(child: Text(snapshot.error.toString()));
                } else {
                  return Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Center(
                        child: CircleAvatar(
                            radius: 50,
                            backgroundImage:
                                NetworkImage(snapshot.data!.profilePicture)
                            // "https://images.unsplash.com/photo-1593642634315-48f5414c3ad9?ixid=MnwxMjA3fDF8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&ixlib=rb-1.2.1&auto=format&fit=crop&w=2069&q=80"),
                            ),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(
                            vertical: 8, horizontal: 16),
                        child: Container(
                          child: TextFormField(
                            enabled: false,
                            controller: TextEditingController(
                              text: snapshot.data!.companyName,
                            ),
                            decoration: InputDecoration(
                                labelText: 'Company Name',
                                labelStyle: TextStyle(
                                    color: Colors.black, fontSize: 22)),
                            readOnly: true,
                            style: TextStyle(
                              fontSize: 18,
                              color: kBlueColor,
                            ),
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(
                            vertical: 8, horizontal: 16),
                        child: Container(
                          child: TextFormField(
                            controller: TextEditingController(
                              text: snapshot.data!.email,
                            ),
                            decoration: InputDecoration(
                                labelText: 'Email id',
                                labelStyle: TextStyle(
                                    color: Colors.black, fontSize: 22)),
                            readOnly: true,
                            style: TextStyle(
                              fontSize: 18,
                              color: kBlueColor,
                            ),
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(
                            vertical: 8, horizontal: 16),
                        child: Container(
                          child: TextFormField(
                            controller: TextEditingController(
                              text: snapshot.data!.phoneNo,
                            ),
                            decoration: InputDecoration(
                                labelText: 'Phone number',
                                labelStyle: TextStyle(
                                    color: Colors.black, fontSize: 22)),
                            readOnly: true,
                            style: TextStyle(
                              fontSize: 18,
                              color: kBlueColor,
                            ),
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(
                            vertical: 8, horizontal: 16),
                        child: Container(
                          child: TextFormField(
                            controller: TextEditingController(
                              text: snapshot.data!.city,
                            ),
                            decoration: InputDecoration(
                                labelText: 'Address',
                                labelStyle: TextStyle(
                                    color: Colors.black, fontSize: 22)),
                            readOnly: true,
                            style: TextStyle(
                              fontSize: 18,
                              color: kBlueColor,
                            ),
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(
                            vertical: 8, horizontal: 16),
                        child: Container(
                          child: TextFormField(
                            controller: TextEditingController(
                              text: snapshot.data!.plan,
                            ),
                            decoration: InputDecoration(
                                labelText: 'Plan',
                                labelStyle: TextStyle(
                                    color: Colors.black, fontSize: 22)),
                            readOnly: true,
                            style: TextStyle(
                              fontSize: 18,
                              color: kBlueColor,
                            ),
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(
                            vertical: 8, horizontal: 16),
                        child: Text('Category Selected',
                            style: TextStyle(
                              fontSize: 16,
                            )),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Wrap(
                            //mainAxisAlignment: MainAxisAlignment.start,
                            children: List.generate(
                          snapshot.data!.categories.length,
                          (index) => Card(
                            elevation: 4,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(20),
                            ),
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Text(
                                snapshot.data!.categories[index],
                                style: TextStyle(
                                  fontSize: 18,
                                  color: kBlueColor.withOpacity(0.8),
                                  fontWeight: FontWeight.w400,
                                ),
                              ),
                            ),
                          ),
                        )),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 8.0, left: 12),
                        child: Text(
                          'About',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 18,
                            color: Colors.grey.shade700,
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 8.0, left: 12),
                        child: Text(
                          snapshot.data!.address,
                          style: TextStyle(),
                        ),
                      ),
                      Container(
                        //color: kBlueColor,
                        //height: 100,
                        child: TabBar(
                          controller: _tabController,
                          //indicatorColor: kBlueColor,

                          //unselectedLabelStyle: TextStyle(color: Colors.white),
                          labelColor: Colors.white,
                          unselectedLabelColor: Colors.blue,

                          labelStyle: TextStyle(),
                          // give the indicator a decoration (color and border radius)
                          indicator: BoxDecoration(
                            borderRadius: BorderRadius.circular(
                              10.0,
                            ),
                            color: kBlueColor,
                          ),
                          tabs: [
                            Tab(
                              text: 'Gallery',
                            ),
                            Tab(
                              text: 'Certificates',
                            ),
                            Tab(
                              text: 'Posts',
                            ),
                            Tab(
                              text: 'Review',
                            ),
                            Tab(
                              text: 'Previous\nResult',
                            ),
                          ],
                        ),
                      ),
                      Container(
                        height: 500,
                        color: Colors.grey.withOpacity(0.1),
                        child:
                            TabBarView(controller: _tabController, children: [
                          GridView.builder(
                              physics: NeverScrollableScrollPhysics(),
                              shrinkWrap: true,
                              itemCount: snapshot.data!.companyImages.length,
                              gridDelegate:
                                  SliverGridDelegateWithFixedCrossAxisCount(
                                      crossAxisCount: 2),
                              itemBuilder: (context, index) {
                                return Padding(
                                  padding: const EdgeInsets.only(
                                      top: 4.0, bottom: 4.0, left: 4, right: 4),
                                  child: Container(
                                    color: Colors.white,
                                    child: Image.network(
                                      snapshot.data!.companyImages[index],
                                    ),
                                  ),
                                );
                              }),
                          GridView.builder(
                              physics: NeverScrollableScrollPhysics(),
                              shrinkWrap: true,
                              itemCount:
                                  snapshot.data!.companyCertification.length,
                              gridDelegate:
                                  SliverGridDelegateWithFixedCrossAxisCount(
                                crossAxisCount: 2,
                                // mainAxisExtent: 10,
                              ),
                              itemBuilder: (context, index) {
                                return Padding(
                                  padding: const EdgeInsets.only(
                                      top: 8.0, bottom: 8.0, left: 4, right: 4),
                                  child: Container(
                                    color: Colors.white,
                                    child: Image.network(
                                        snapshot
                                            .data!.companyCertification[index],
                                        height: 100,
                                        fit: BoxFit.cover),
                                  ),
                                );
                              }),
                          Text("data"),
                          GridView.builder(
                              physics: NeverScrollableScrollPhysics(),
                              shrinkWrap: true,
                              itemCount: snapshot.data!.reviews.length,
                              gridDelegate:
                                  SliverGridDelegateWithFixedCrossAxisCount(
                                      crossAxisCount: 2),
                              itemBuilder: (context, index) {
                                return Padding(
                                  padding: const EdgeInsets.only(
                                      top: 8.0, bottom: 8.0, left: 4, right: 4),
                                  child: Container(
                                    color: Colors.white,
                                    child: Image.network(
                                        snapshot.data!.reviews[index]),
                                  ),
                                );
                              }),
                          Text('HJnN'),
                        ]),
                      )
                    ],
                  );
                }
                //return CircularProgressIndicator();
              }),
        ),
      ),
    );
  }
}
