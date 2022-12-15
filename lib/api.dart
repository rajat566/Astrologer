import 'dart:convert';

import 'package:astrology/Models/user_model.dart';
import 'package:astrology/bitcoin.dart';
import 'package:astrology/Models/bitcoin_model.dart';
import 'package:astrology/blog.dart';
import 'package:astrology/pages/bottomNavBar.dart';
import 'package:astrology/placeapi.dart';
import 'package:astrology/profile.dart';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class Api extends StatefulWidget {
  const Api({Key? key}) : super(key: key);
//https://astrolekha.com/Admin/API_Call/GetDashboard
  @override
  State<Api> createState() => _ApiState();
}

class _ApiState extends State<Api> {
  List pages = [Api(), Profile(), Blog(), Bitcoin()];
  int currentIndex = 0;
  void onTap(int index) {
    setState(() {
      currentIndex = index;
    });
  }

  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white70,
      appBar: AppBar(
          title: Text(
            "Astrologer",
            style: TextStyle(color: Colors.blue),
          ),
          backgroundColor: Colors.white),
      drawer: Drawer(),

      bottomNavigationBar: navb(),

      // bottomNavigationBar: Container(
      //   height: 80,
      //   padding: EdgeInsets.symmetric(vertical: 10, horizontal: 5),
      //   margin: EdgeInsets.all(25),
      //   decoration: BoxDecoration(
      //       color: Colors.black, borderRadius: BorderRadius.circular(10)),
      //   child: DefaultTabController(
      //     length: 4,
      //     child: TabBar(
      //       tabs: [
      //         Tab(
      //           icon: Icon(Icons.home),
      //           text: "Home",
      //         ),
      //         Tab(
      //           icon: Icon(Icons.category),
      //           text: "Categories",
      //         ),
      //         Tab(
      //           icon: Icon(Icons.home_outlined),
      //           text: "MyCart",
      //         ),
      //         Tab(
      //           icon: Icon(Icons.home_work),
      //           text: "Profile",
      //         )
      //       ],
      //     ),
      //   ),
      // ),

      body:
       SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                child: TextField(
                  decoration: InputDecoration(
                      filled: true,
                      fillColor: Colors.white70,
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(8),
                          borderSide: BorderSide.none),
                      hintText: "Search Astrologer , Astromail products",
                      prefixIcon: Icon(Icons.search),
                      prefixIconColor: Colors.pink),
                ),
              ),
              SizedBox(
                height: 50,
              ),
              Row(
                children: [
                  Container(
                    height: 70,
                    width: 70,
                    child: IconButton(
                      icon: Icon(Icons.settings),
                      onPressed: () {
                        Navigator.push(context,
                            MaterialPageRoute(builder: (context) => Bitcoin()));
                      },
                      color: Colors.white,
                    ),
                    decoration: BoxDecoration(
                        color: Color.fromARGB(255, 4, 88, 148),
                        borderRadius: BorderRadius.circular(10)),
                  ),
                  SizedBox(
                    height: 50,
                    width: 15,
                  ),
                  Container(
                    height: 70,
                    width: 70,
                    child: IconButton(
                      icon: Icon(Icons.person),
                      onPressed: () {},
                      color: Colors.white,
                    ),
                    decoration: BoxDecoration(
                        color: Color.fromARGB(255, 4, 88, 148),
                        borderRadius: BorderRadius.circular(10)),
                  ),
                  SizedBox(
                    width: 15,
                  ),
                  Container(
                    height: 70,
                    width: 70,
                    child: IconButton(
                      icon: Icon(Icons.place),
                      onPressed: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => Placeapi()));
                      },
                      color: Colors.white,
                    ),
                    decoration: BoxDecoration(
                        color: Color.fromARGB(255, 4, 88, 148),
                        borderRadius: BorderRadius.circular(10)),
                  ),
                  SizedBox(
                    width: 15,
                  ),
                  Container(
                    height: 70,
                    width: 70,
                    child: IconButton(
                      icon: Icon(Icons.book),
                      onPressed: () {
                        Navigator.push(context,
                            MaterialPageRoute(builder: (context) => Blogapi()));
                      },
                      color: Colors.white,
                    ),
                    decoration: BoxDecoration(
                        color: Color.fromARGB(255, 4, 100, 148),
                        borderRadius: BorderRadius.circular(10)),
                  ),
                ],
              ),
              SizedBox(
                height: 8,
              ),
              Column(
                children: [
                  Row(
                    children: [
                      Text(
                        "Horoscope",
                        style: TextStyle(color: Colors.black54),
                      ),
                      SizedBox(
                        width: 20,
                      ),
                      Text(
                        "Free Kundli",
                        style: TextStyle(color: Colors.black54),
                      ),
                      SizedBox(
                        width: 20,
                      ),
                      Text(
                        "Matching",
                        style: TextStyle(color: Colors.black54),
                      ),
                      SizedBox(
                        width: 30,
                      ),
                      Text(
                        "BLog",
                        style: TextStyle(color: Colors.black54),
                      )
                    ],
                  ),
                  SizedBox(
                    height: 30,
                  ),
                  Container(
                    height: 140,
                    width: 350,
                    child: Center(
                      child: Text(
                        "Got Any Questions? chat with Astrologer for free",
                        style: TextStyle(color: Colors.white, fontSize: 20),
                      ),
                    ),
                    decoration: BoxDecoration(
                        color: Color.fromARGB(255, 111, 20, 222),
                        borderRadius: BorderRadius.circular(8)),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  BottomNavigationBar navb() {
    return BottomNavigationBar(
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
        ]);
  }
}
