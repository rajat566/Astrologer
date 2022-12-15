import 'package:astrology/Models/user_model.dart';
import 'package:astrology/api.dart';
import 'package:astrology/bitcoin.dart';
import 'package:astrology/profile.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/material.dart';

class BottomNavBar extends StatefulWidget {
  BottomNavBar({Key? key}) : super(key: key);

  @override
  State<BottomNavBar> createState() => _BottomNavBarState();
}

class _BottomNavBarState extends State<BottomNavBar> {
  List pages = [Api(), Profile(), Blog(), Bitcoin()];

  @override
  Widget build(BuildContext context) {
    List pages = [Api(), Profile(), Blog(), Bitcoin()];
    int currentIndex = 0;
    void onTap(int index) {
      blsetState(() {
        currentIndex = index;
      });
    }

    return Scaffold(
      body: pages[currentIndex],
      bottomNavigationBar: BottomNavigationBar(
          onTap: onTap,
          currentIndex: currentIndex,
          selectedItemColor: Colors.black,
          unselectedItemColor: Colors.grey.withOpacity(0.5),
          items: [
            BottomNavigationBarItem(icon: Icon(Icons.home), label: "Home"),
            BottomNavigationBarItem(
                icon: Icon(Icons.access_alarms), label: "Blog"),
            BottomNavigationBarItem(
                icon: Icon(Icons.keyboard_arrow_left_rounded),
                label: "Profile"),
            BottomNavigationBarItem(
                icon: Icon(Icons.format_align_justify), label: "Home")
          ]),
    );
  }
}
