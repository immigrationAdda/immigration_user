
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:immigration/Models/postmodel.dart';
import 'package:immigration/SizeConfig.dart';

import '../constants.dart';
import 'package:http/http.dart' as http;

class PostDetails extends StatelessWidget {
  late final String? pId;

  PostDetails(this.pId);

  Future<PostModel> getDetails() async{
    var res=await http.get(Uri.parse("https://frozen-savannah-16893.herokuapp.com/Seller/postList/"+pId!));
     Map<String,dynamic> result=json.decode(res.body);
     if(res.statusCode==200){
     print("///"+result.toString());}else{
       print("not"+res.statusCode.toString());
     }
     PostModel postModel=PostModel.fromJson(result);

     return postModel;
  }

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);

getDetails();

    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        actions: [

          IconButton(onPressed: null, icon: Icon(Icons.search,color: kBlueColor,
          ))
        ],
        leading: Image.asset("assets/images/logo.png"),
        backgroundColor: Colors.white,
        title: Text("Immigration Adda",
          style: TextStyle(color: kBlueColor),),

      ),
      body: Container(
        color: lightGray,
        child: FutureBuilder<PostModel>(
          future: getDetails(),
          builder: (context, AsyncSnapshot<PostModel> snapshot) {
           if(snapshot.connectionState==ConnectionState.waiting){
             return Container(
               width: SizeConfig.screenWidth,
               height: SizeConfig.screenHeight,
               alignment: Alignment.center,
               color: Colors.white,
               child: CircularProgressIndicator(),
             );
            }else{
             return  ListView(children: [

            Container(
              height: SizeConfig.safeBlockVertical! * 60,
              child: Card(
                child: ListView(

                  children: [
                    Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: Image.network(
                        snapshot.data!.postImage,
                        height: SizeConfig.safeBlockVertical! * 40,
                      ),
                    ),
                    Container(
                      alignment: Alignment.center,
                      width: SizeConfig.screenWidth,
                      child: Text(
                        snapshot.data!.title,
                        style:
                        TextStyle(fontSize: 18, fontWeight: FontWeight.w400),
                      ),
                    ),
                     Container(
                      alignment: Alignment.center,
                      color: kBlueColor,
                      width: SizeConfig.screenWidth,
                      child: Text(
                        snapshot.data!.categories.toUpperCase()
                        , textAlign: TextAlign.justify,
                        style: TextStyle(

                            fontSize: SizeConfig.screenHeight! / 35,
                            inherit: true,
                            color: Colors.white,
                            fontWeight: FontWeight.bold),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Container(
                        alignment: Alignment.center,
                        width: SizeConfig.screenWidth,
                        child: Text(
                          snapshot.data!.description
                          , textAlign: TextAlign.justify,
                          style: TextStyle(
                              fontSize: SizeConfig.screenHeight! / 55,
                              inherit: true,
                              fontWeight: FontWeight.w400),
                        ),
                      ),
                    ),
                  ],
                ),
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20.0)),
              ),
            ),
            Card(
              elevation: 10,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Padding(
                    padding:
                    const EdgeInsets.symmetric( vertical: 3 , horizontal: 7 ),
                    child: Container(
                      height: SizeConfig.safeBlockVertical! * 10,
                      child: CircleAvatar(
                        radius: SizeConfig.safeBlockVertical! * 4,
                        backgroundColor: Colors.white,
                        child: Image.asset(
                          "assets/images/person.png",
                        ),
                      ),
                    ),
                  ),
                  Container(
                    alignment: Alignment.centerLeft,
                    width: 200,
                    child: Text(
                      " Company Name",
                      style: TextStyle(fontSize: 18, fontWeight: FontWeight.w400),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: CircleAvatar(
                      backgroundColor: Colors.white,
                      child: IconButton(
                        icon: Icon(Icons.chat),
                        onPressed: null,
                      ),
                    ),
                  ),
                ],
              ),
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20.0)),
            ),
          ]);}

        },

        ),
      ),
    );
  }


}
