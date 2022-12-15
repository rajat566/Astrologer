import 'dart:async';
import 'dart:ui';

import 'package:astrology/api.dart';
import 'package:flutter/material.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Timer(Duration(seconds: 4), () {
      Navigator.push(context, MaterialPageRoute(builder: (context) => Api()));
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Color.fromARGB(255, 202, 202, 208),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              child: Text(
                "",
                style: TextStyle(
                    fontSize: 35, color: Color.fromARGB(255, 120, 170, 220)),
              ),
            ),
            Center(
              child: Image(
                height: 250,
                fit: BoxFit.fill,
                image: AssetImage("images/astro.png"),
              ),
            ),
            Text(
              "Astrologer",
              style: TextStyle(
                  fontSize: 35, color: Color.fromARGB(255, 120, 170, 220)),
            )
          ],
        ));
  }
}
