import 'dart:convert';
import 'package:astrology/Models/user_model.dart';
import 'package:astrology/Models/userlist_model.dart';
import 'package:astrology/bitcoin.dart';
import 'package:astrology/placeapi.dart';
import 'package:astrology/profile.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:flutter_rating_bar/flutter_rating_bar.dart';

class Blogapi extends StatefulWidget {
  const Blogapi({Key? key}) : super(key: key);

  static const String routename = '/blog';

  @override
  State<Blogapi> createState() => _BlogapiState();
}

class _BlogapiState extends State<Blogapi> {
  Future<Userlist> getproductapi() async {
    final response = await http.get(Uri.parse(
        'https://gravitinfosystems.com/Development/Astrolekha2/Admin/API_Call/GetAstrologers?{Token= DhklSUpo98DBI%26HJ|!@%23jkkh%23GSHG78927Fhfs76&Type=Chat&Category=All&Selected_Cat=1'));
    var data = jsonDecode(response.body.toString());
    if (response.statusCode == 200) {
      return Userlist.fromJson(data);
    } else {
      return Userlist.fromJson(data);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Chat with Astrologer"),
      ),
      body: Column(children: [
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Container(
            child: TextField(
              textAlign: TextAlign.center,
              decoration: InputDecoration(
                  filled: true,
                  fillColor: Color.fromARGB(179, 214, 211, 211),
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(8),
                      borderSide: BorderSide.none),
                  hintText: "Search Astrologer ",
                  prefixIcon: Icon(Icons.search),
                  prefixIconColor: Colors.pink),
            ),
          ),
        ),
        SizedBox(
          height: 8,
        ),
        SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Row(
            children: [
              SizedBox(
                width: 8,
              ),
              Container(
                height: 40,
                width: 90,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(
                      6,
                    ),
                    color: Color.fromARGB(255, 87, 177, 250)),
                child: Row(
                  children: [
                    IconButton(
                        onPressed: () {},
                        icon: Icon(
                          Icons.cake,
                          color: Colors.white,
                        )),
                    Text(
                      "All",
                      style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: 20),
                    ),
                  ],
                ),
              ),
              SizedBox(
                width: 8,
              ),
              btn("Business", Color.fromARGB(255, 163, 164, 168)),
              SizedBox(
                width: 8,
              ),
              btn("Education", Color.fromARGB(255, 163, 164, 168)),
              SizedBox(
                width: 8,
              ),
              btn("career", Color.fromARGB(255, 163, 164, 168))
            ],
          ),
        ),
        Expanded(
            child: FutureBuilder<Userlist>(
                future: getproductapi(),
                builder: (context, snapshot) {
                  if (snapshot.hasData) {
                    return ListView.builder(
                        itemCount: snapshot.data!.astrologers!.length,
                        itemBuilder: (context, index) {
                          return Column(
                            children: [
                              Container(
                                height: 210,
                                width: 345,
                                child: InkWell(
                                  onTap: () {
                                    Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) => Profile(),
                                            settings: RouteSettings(
                                                arguments: snapshot.data!
                                                    .astrologers![index])));
                                  },
                                  child: Card(
                                    shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(15),
                                        side: BorderSide(
                                            color: Colors.white, width: 1)),
                                    margin: EdgeInsets.only(
                                        left: 4, top: 10, bottom: 10),
                                    child: Row(
                                      children: [
                                        Container(
                                          margin: EdgeInsets.only(top: 28),
                                          child: Column(
                                            children: [
                                              ClipRRect(
                                                borderRadius:
                                                    BorderRadius.circular(10),
                                                child: Image.asset(
                                                  'images/dhoni.jpg',
                                                  height: 100,
                                                ),
                                              ),
                                              SizedBox(
                                                height: 10,
                                              ),
                                              Wrap(
                                                  children: List.generate(
                                                      5,
                                                      (index) => Icon(
                                                            Icons.star,
                                                            color:
                                                                Color.fromARGB(
                                                                    255,
                                                                    182,
                                                                    213,
                                                                    179),
                                                            size: 15,
                                                          ))),
                                              SizedBox(
                                                height: 5,
                                              ),
                                              Text(
                                                "Total " '745',
                                                style: TextStyle(
                                                    fontWeight:
                                                        FontWeight.w300),
                                              ),
                                            ],
                                          ),
                                        ),
                                        SizedBox(
                                          width: 1,
                                        ),
                                        Padding(
                                          padding: const EdgeInsets.only(
                                              left: 4, right: 0, top: 15),
                                          child: Row(
                                            children: [
                                              Container(
                                                margin: EdgeInsets.all(5),
                                                child: Column(
                                                  children: [
                                                    Row(
                                                      children: [
                                                        Text(
                                                          "${snapshot.data!.astrologers![index].firstName!.toString()}",
                                                          style: TextStyle(
                                                              fontSize: 20,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .w500),
                                                        ),
                                                        SizedBox(
                                                          width: 5,
                                                        ),
                                                        Text(
                                                          "${snapshot.data!.astrologers![index].lastName.toString()}",
                                                          style: TextStyle(
                                                              fontSize: 20,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .w500),
                                                        ),
                                                      ],
                                                    ),
                                                    SizedBox(
                                                      height: 13,
                                                    ),
                                                    Padding(
                                                      padding:
                                                          const EdgeInsets.only(
                                                              right: 60),
                                                      child: Text(
                                                        "${snapshot.data!.astrologers![index].country}",
                                                        style: TextStyle(
                                                            fontSize: 12,
                                                            fontWeight:
                                                                FontWeight
                                                                    .w300),
                                                      ),
                                                    ),
                                                    SizedBox(
                                                      height: 5,
                                                    ),
                                                    Padding(
                                                      padding:
                                                          const EdgeInsets.only(
                                                              right: 60),
                                                      child: Text(
                                                        "${snapshot.data!.astrologers![index].expertise}",
                                                        style: TextStyle(
                                                            fontSize: 12,
                                                            fontWeight:
                                                                FontWeight
                                                                    .w300),
                                                      ),
                                                    ),
                                                    SizedBox(
                                                      height: 5,
                                                    ),
                                                    Padding(
                                                      padding:
                                                          const EdgeInsets.only(
                                                              right: 48),
                                                      child: Text(
                                                        "Exp: ${snapshot.data!.astrologers![index].experience}",
                                                        style: TextStyle(
                                                            fontSize: 12,
                                                            fontWeight:
                                                                FontWeight
                                                                    .w300),
                                                      ),
                                                    ),
                                                    SizedBox(
                                                      height: 5,
                                                    ),
                                                    Padding(
                                                      padding:
                                                          const EdgeInsets.only(
                                                              right: 48),
                                                      child: Text(
                                                        "₹ ${snapshot.data!.astrologers![index].chatPrice} /min",
                                                        style: TextStyle(
                                                            fontSize: 12,
                                                            fontWeight:
                                                                FontWeight
                                                                    .w300),
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                        SizedBox(
                                          width: 62,
                                        ),
                                        Column(
                                          children: [
                                            Text(
                                              "${snapshot.data!.astrologers![index].chatAvailStatus}",
                                              style: TextStyle(
                                                  fontSize: 13,
                                                  color: getcolor()),
                                            ),
                                            SizedBox(
                                              height: 120,
                                            ),
                                            OutlinedButton(
                                                child: Text(
                                                  "chat",
                                                ),
                                                style: ElevatedButton.styleFrom(
                                                    shape: StadiumBorder(),
                                                    side: BorderSide(
                                                        width: 1,
                                                        color: Colors.blue)),
                                                onPressed: () {}),
                                          ],
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              )
                            ],
                          );
                        });
                  } else {
                    return Center(child: CircularProgressIndicator());
                  }
                }))
      ]),
    );
  }

  Container btn(String text, Color c) {
    return Container(
      height: 37,
      width: 115,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(
            6,
          ),
          color: c),
      child: Row(
        children: [
          IconButton(
              onPressed: () {},
              icon: Icon(
                Icons.account_balance,
                color: Colors.white,
              )),
          Text(
            "$text",
            style: TextStyle(
                color: Colors.black, fontWeight: FontWeight.bold, fontSize: 14),
          ),
        ],
      ),
    );
  }
}

getcolor() {
  if (chatAvailStatus == 'Online') {
    return Color.fromARGB(255, 0, 255, 119);
  } else {
    return Color.fromARGB(255, 18, 188, 18);
  }
}
