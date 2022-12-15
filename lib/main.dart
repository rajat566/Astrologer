import 'package:astrology/api.dart';
import 'package:astrology/blog.dart';
import 'package:astrology/pages/bottomNavBar.dart';
import 'package:astrology/profile.dart';
import 'package:astrology/splash_screen.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Astrology",
      home: SplashScreen(),

      routes: {
        Blogapi.routename: (context) => Blogapi(),
        Profile.routename: (context) => Profile(),
      },
      // initialRoute: Home_veg.id,
      // routes: {
      //   Home.id: (context) => Home(),
      //   Phone.id: (context) => Phone(),
      //   Home_veg.id: (context) => Home_veg()
    );
  }
}
