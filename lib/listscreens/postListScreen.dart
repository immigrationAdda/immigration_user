import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:immigration/Models/postmodel.dart';
import 'package:immigration/SizeConfig.dart';
import 'package:immigration/constants.dart';
import 'package:http/http.dart' as http;
import 'package:immigration/screens/Post_detals.dart';

class PostListScreen extends StatefulWidget {
  const PostListScreen({Key? key}) : super(key: key);

  @override
  _PostListScreenState createState() => _PostListScreenState();
}

class _PostListScreenState extends State<PostListScreen> {
  late PostModel postModel;
  List<PostModel> postModelList = [];
  String uId = "";
  late final int value = 3;

  Future<List<PostModel>> getListData() async {
    var res = await http.get(Uri.parse(
        "https://frozen-savannah-16893.herokuapp.com/Seller/postList"));
    var obj = json.decode(res.body);
    print("gkjglug======" + obj.toString());
    postModelList.clear();
    for (var obj1 in obj) {
      postModel = new PostModel.fromJson(obj1);
      postModelList.add(postModel);
      print("hg.khl===========${postModelList.toString()}");
    }
    print("hg.khl===========${postModelList.length}");
// List<SellerList> sellerList=new SellerList.fromJson(obj) as List<SellerList>;

    return postModelList;
  }

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return ListView(
        shrinkWrap: true,
        physics: NeverScrollableScrollPhysics(),
        children: [
          FutureBuilder(
              future: getListData(),
              builder: (context, AsyncSnapshot<List<PostModel>> snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return Center(
                      child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      CircularProgressIndicator(),
                      Text("Loading...."),
                    ],
                  ));
                }
                if (snapshot.connectionState == ConnectionState.done) {
                  return Padding(
                    padding:
                        const EdgeInsets.only(bottom: 25, left: 6, right: 6),
                    child: ListView.builder(
                      shrinkWrap: true,
                      physics: NeverScrollableScrollPhysics(),
                      itemCount: postModelList.length,
                      itemBuilder: (context, index) {
                        return GestureDetector(
                          onTap: () {
                            Navigator.push(context,MaterialPageRoute(builder: (context)=>PostDetails(snapshot.data![index].pId)));
                          },
                          child: Container(
                              margin: EdgeInsets.only(top: 15),
                              width: SizeConfig.screenWidth!,
                              height: SizeConfig.screenHeight! / 1.64,
                              child: Card(
                                margin: EdgeInsets.zero,
                                clipBehavior: Clip.antiAliasWithSaveLayer,
                                elevation: 8,
                                shape: RoundedRectangleBorder(
                                    borderRadius:
                                        BorderRadiusDirectional.circular(20)),
                                child: Stack(overflow: Overflow.clip, children: [
                                  Column(
                                    textDirection: TextDirection.ltr,
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Image.network(
                                        snapshot.data![index].postImage
                                            .toString(),
                                        height: SizeConfig.screenWidth! / 1,
                                        width: SizeConfig.screenWidth,
                                        fit: BoxFit.cover,
                                        alignment: Alignment.center,
                                      ),
                                      Container(
                                        color: kBlueColor,
                                        width: SizeConfig.screenWidth!,
                                        height: SizeConfig.blockSizeVertical! * 4,
                                        alignment: Alignment.center,
                                        child: Text(
                                          snapshot.data![index].categories
                                              .toString().toUpperCase(),

                                          style: TextStyle(

                                              color: Colors.white,
                                              fontSize: SizeConfig
                                                      .blockSizeHorizontal! *
                                                  6,

                                              fontWeight: FontWeight.bold,
                                              backgroundColor: kBlueColor),
                                        ),
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.only(
                                            left: 5, top: 5),
                                        child: Text(
                                          snapshot.data![index].title.toString(),
                                          textAlign: TextAlign.start,
                                          style: TextStyle(
                                              color: Colors.black,
                                              fontWeight: FontWeight.bold,
                                              fontSize:
                                                  SizeConfig.blockSizeVertical! *
                                                      3),
                                        ),
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.only(left: 7),
                                        child: Text(
                                          snapshot.data![index].description
                                              .toString(),
                                          maxLines: 1,
                                          overflow: TextOverflow.ellipsis,
                                          style: TextStyle(
                                            color: kBlueColor,

                                            fontSize:
                                                SizeConfig.screenHeight!/30,
                                            fontWeight: FontWeight.bold,
                                          ),
                                        ),
                                      )
                                    ],
                                  ),
                                  Align(
                                    alignment: Alignment.topRight,
                                    child: Card(
                                      elevation: 8,
                                      margin: EdgeInsets.all(20),
                                      shape: RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(30)),
                                      child: IconButton(
                                        onPressed: () {
                                          http.post(Uri.parse(
                                              "https://frozen-savannah-16893.herokuapp.com/User/favorite/" +
                                                  uId +
                                                  "/" +
                                                  snapshot.data![index].pId
                                                      .toString()));
                                        },
                                        icon: Icon(Icons.favorite_border),
                                        color: Colors.red,
                                      ),
                                    ),
                                  )
                                ]),
                              )),
                        );
                      },
                    ),
                  );
                }
                return CircularProgressIndicator();
              }),
        ]);
  }
}
