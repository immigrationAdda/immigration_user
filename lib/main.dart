import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:immigration/Forms/education_loan.dart';
import 'package:immigration/Forms/travell_insurance.dart';
import 'package:immigration/listscreens/my_postListScreen.dart';
import 'package:immigration/listscreens/postListScreen.dart';
import 'package:immigration/listscreens/sellerLIstScreen.dart';
import 'package:immigration/postCreateScreens/FrenchiseScreen.dart';
import 'package:immigration/postCreateScreens/JobScreen.dart';
import 'package:immigration/postCreateScreens/MyPostScreen.dart';
import 'package:immigration/postCreateScreens/UserPost.dart';
import 'package:immigration/postCreateScreens/luggageScreen.dart';
import 'package:immigration/postCreateScreens/pr_score.dart';
import 'package:immigration/provider/auth_provider.dart';
import 'package:immigration/screens/Home_page.dart';
import 'package:immigration/screens/Login.dart';
import 'package:immigration/screens/MainScreen.dart';
import 'package:immigration/screens/Post_detals.dart';
import 'package:immigration/screens/ProfileScreen.dart';
import 'package:immigration/screens/SplashScreen.dart';
import 'package:immigration/screens/UserProfileDetails.dart';
import 'package:immigration/screens/profile.dart';
import 'package:provider/provider.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => AuthProvider()),
        //ChangeNotifierProvider(create: (_) => DataFunction()),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData(fontFamily: "segoe"),
        home:    EducationLoan(),   )
    );

  }
}





