import 'package:auto_size_text_pk/auto_size_text_pk.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:immigration/SizeConfig.dart';
import 'package:immigration/constants.dart';
import 'package:immigration/listscreens/postListScreen.dart';
import 'package:immigration/listscreens/sellerLIstScreen.dart';
import 'package:immigration/postCreateScreens/pr_score.dart';
import 'package:immigration/screens/Login.dart';
import 'package:immigration/screens/ProfileScreen.dart';
import 'package:immigration/screens/luggage_post_user.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Scaffold(
      backgroundColor: lightGray,
      body: SingleChildScrollView(
        child: Column(

            children:[
            ListView(
            physics:const NeverScrollableScrollPhysics(),
        shrinkWrap: true,
        children:[
          Padding(
            padding: const EdgeInsets.only(left: 20,top: 10),
            child: Text(
              "Browse Categories",
              style: TextStyle(
                  fontSize: SizeConfig.blockSizeHorizontal! * 5,
                  fontWeight: FontWeight.bold,
                  color: kBlueColor),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: GridView(
              shrinkWrap: true,
              physics: NeverScrollableScrollPhysics(),
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 4, childAspectRatio: 1.1),
              children: [
                GestureDetector(
                    onTap: () {
                      Navigator.of(context).push(MaterialPageRoute(
                          builder: (context) => SellerLists(type: "IELTS")));
                    },
                    child: button(context, "IELTS", "assets/images/ielts.png")),
                GestureDetector(
                    onTap: () {
                      Navigator.of(context).push(MaterialPageRoute(
                          builder: (context) =>
                              SellerLists(type: "Passport")));
                    },
                    child: button(
                        context, "Passport", "assets/images/passport.png")),
                GestureDetector(
                    onTap: () {
                      Navigator.of(context).push(MaterialPageRoute(
                          builder: (context) =>
                              SellerLists(type: "Study Visa")));
                    },
                    child: button(context, "Study Visa", "assets/images/visa.png")),
                GestureDetector(
                    onTap: () {
                      Navigator.of(context).push(MaterialPageRoute(
                          builder: (context) =>
                              SellerLists(type: "Education Loan")));
                    },
                    child: button(context, "Education Loan",
                        "assets/images/university.png")),
                GestureDetector(
                    onTap: () {
                      Navigator.of(context).push(MaterialPageRoute(
                          builder: (context) =>
                              SellerLists(type: "Air Ticket")));
                    },
                    child: button(
                        context, "Air Ticket", "assets/images/airplane.png")),
                GestureDetector(
                    onTap: () {
                      Navigator.of(context).push(MaterialPageRoute(
                          builder: (context) =>
                              SellerLists(type: "Travel Insurance")));
                    },
                    child: button(context, "Travel\nInsurance",
                        "assets/images/travel-insurance.png")),


                GestureDetector(
                    onTap: () {
                      Navigator.of(context).push(MaterialPageRoute(
                          builder: (context) =>
                              SellerLists(type: "Money Exchange")));
                    },
                    child: button(context, "Money\nExchange",
                        "assets/images/dollar-rupee.png")),
                GestureDetector(
                    onTap: () {
                      Navigator.of(context).push(MaterialPageRoute(
                          builder: (context) =>
                              SellerLists(type: "Transportation")));
                    },
                    child:
                        button(context, "Transport\nFor AirPort", "assets/images/car.png")),
                GestureDetector(
                    onTap: () {
                      Navigator.of(context).push(MaterialPageRoute(
                          builder: (context) =>
                              SellerLists(type: "Legal Advisor")));
                    },
                    child: button(context, "Legal\nAdvisor",
                        "assets/images/legal.png")),
                 GestureDetector(
                    onTap: () {
                      Navigator.of(context).push(MaterialPageRoute(
                          builder: (context) =>
                              SellerLists(type: "International Courier")));
                    },
                    child: button(context, "International\nCourier",
                        "assets/images/courier.png")),
                GestureDetector(
                    onTap: () {
                      Navigator.of(context).push(MaterialPageRoute(
                          builder: (context) =>
                              SellerLists(type: "Work Permit")));
                    },
                    child: button(context, "Work\nPermit",
                        "assets/images/job-seeker.png")),
                GestureDetector(
                    onTap: () {
                      Navigator.of(context).push(MaterialPageRoute(
                          builder: (context) =>
                              SellerLists(type: "Tourist & Business Visa")));
                    },
                    child: button(context, "Tourist &\nBusiness Visa",
                        "assets/images/bus-visa.png")),
                GestureDetector(
                    onTap: () {
                      Navigator.of(context).push(MaterialPageRoute(
                          builder: (context) =>
                              SellerLists(type: "Permanent Residence")));
                    },
                    child: button(context, "Permanent\nResident",
                        "assets/images/permanent.png")),
                GestureDetector(
                    onTap: () {
                      Navigator.of(context).push(MaterialPageRoute(
                          builder: (context) =>
                              SellerLists(type: "Tour Travel")));
                    },
                    child: button(context, "Tour & Travel\nPackage",
                        "assets/images/tourTravel.png")),
                GestureDetector(
                    onTap: () {
                      Navigator.of(context).push(MaterialPageRoute(
                          builder: (context) =>
                              SellerLists(type: "Jobs at Abroad")));
                    },
                    child: button(context, "Jobs \n At Abroad",
                        "assets/images/jobsAtAbroad.png")),
                GestureDetector(
                    onTap: () {
                      Navigator.of(context).push(MaterialPageRoute(
                          builder: (context) =>
                              SellerLists(type: "Accommodation at Abraod")));
                    },
                    child: button(context, "Accommodation at Abroad",
                        "assets/images/accommodation.png")),
                GestureDetector(
                    onTap: () {
                      Navigator.of(context).push(MaterialPageRoute(
                          builder: (context) =>
                              SellerLists(type: "Events")));
                    },
                    child: button(context, "Event", "assets/images/event.png")),

                GestureDetector(
                    onTap: () {

                    },
                    child: button(context, "Online IELTS Classes",
                        "assets/images/ielts-online-class.png")),
                GestureDetector(
                    onTap: () {
                      print("object yes");
                    },
                    child: button(context, "Online Weekly Free IELTS Test",
                        "assets/images/week-online-class.png")),

                GestureDetector(
                    onTap: () {
                      Navigator.of(context).push(MaterialPageRoute(
                          builder: (context) =>
                               PRScore()));
                    },
                    child: button(context, "Check PR/Study Visa Score Free",
                        "assets/images/check-pr.png")),
                GestureDetector(
                  onTap: () {
                    print("object yes");
                  },
                  child: button(context, "Buyer\nRequirements",
                      "assets/images/Buyer-ads.png"),
                ),
                GestureDetector(
                    onTap: () {
                      print("object yes");
                    },
                    child: button(
                        context, "Job\nRequirements", "assets/images/job.png")),
                GestureDetector(
                    onTap: () {
                      print("object yes");
                    },
                    child: button(
                        context, "Franchise", "assets/images/franchise.png")),
                GestureDetector(
                    onTap: () {
                      Navigator.of(context).push(MaterialPageRoute(
                          builder: (context) =>
                              LuggagePostByUser()));
                      print("object yes");
                    },
                    child: button(context, "Luggage\nAdjustment",
                        "assets/images/luggage.png")),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 20),
            child: Text("Latest Deals For You",
    style: TextStyle(
    fontSize: SizeConfig.blockSizeHorizontal! * 5,
    fontWeight: FontWeight.bold,
    color: kBlueColor),
            ),
          ),

          PostListScreen(uri: "https://frozen-savannah-16893.herokuapp.com/Seller/postLists/f"),]),







        ],
      ),)
    );
  }
}

Widget button(BuildContext context, String text, String icon) {
  return Container(
    child: Card(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15.0)),
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 3, horizontal: 5),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              icon,
              height: SizeConfig.safeBlockVertical! * 4,
              width: SizeConfig.safeBlockHorizontal! * 8,
            ),
            Padding(
              padding: const EdgeInsets.only(top: 2),
              child: Text(
                text,
                textAlign: TextAlign.center,
                style: TextStyle(
                    color: kBlueColor,
                    fontSize: SizeConfig.safeBlockHorizontal! * 2.8),

              ),
            )
          ],
        ),
      ),
    ),
  );
}
