import 'dart:convert';
import 'package:astrology/Models/user_model.dart';
import 'package:astrology/Models/userlist_model.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class Placeapi extends StatefulWidget {
  const Placeapi({Key? key}) : super(key: key);

  @override
  State<Placeapi> createState() => _PlaceapiState();
}

class _PlaceapiState extends State<Placeapi> {
  Future<Usermodel> getproductapi() async {
    final response = await http
        .get(Uri.parse('https://astrolekha.com/Admin/API_Call/GetDashboard'));
    var data = jsonDecode(response.body);
    if (response.statusCode == 200) {
      return Usermodel.fromJson(data);
    } else {
      return Usermodel.fromJson(data);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("ji"),
      ),
      body: Column(children: [
        Expanded(
            child: FutureBuilder<Usermodel>(
                future: getproductapi(),
                builder: (context, snapshot) {
                  if (snapshot.hasData) {
                    return ListView.builder(
                        itemCount: snapshot.data!.astrologers!.length,
                        itemBuilder: (context, index) {
                          return Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Container(
                                height: MediaQuery.of(context).size.height * .3,
                                width: MediaQuery.of(context).size.height * 1,
                                child: ListView.builder(
                                    scrollDirection: Axis.horizontal,
                                    itemCount:
                                        snapshot.data!.astrologers!.length,
                                    itemBuilder: (context, position) {
                                      ;
                                      return Container(
                                        height: 140,
                                        child: Card(
                                          margin: EdgeInsets.only(
                                              left: 10, top: 10, bottom: 70),
                                          child: Row(
                                            children: [
                                              Image.asset(
                                                'images/dhoni.jpg',
                                                height: 100,
                                              ),

                                              SizedBox(
                                                width: 1,
                                              ),

                                              Padding(
                                                padding: const EdgeInsets.only(
                                                    left: 8, right: 4, top: 14),
                                                child: Column(
                                                  children: [
                                                    Text(
                                                      "${snapshot.data!.astrologers![index].firstName!.toString()} ",
                                                      style: TextStyle(
                                                          fontSize: 20),
                                                    ),
                                                    SizedBox(
                                                      height: 13,
                                                    ),
                                                    Padding(
                                                      padding:
                                                          const EdgeInsets.only(
                                                              right: 60),
                                                      child: Text(
                                                        "${snapshot.data!.astrologers![index].language}",
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

                                              SizedBox(
                                                width: 115,
                                              ),
                                              Text(
                                                "${snapshot.data!.astrologers![index].chatAvailStatus}",
                                                style: TextStyle(
                                                    fontSize: 13,
                                                    color: getmecolor()),
                                              ),

                                              // Container(
                                              //   height: 56,
                                              //   width: 260,
                                              //   child: Padding(
                                              //     padding:
                                              //         const EdgeInsets.fromLTRB(
                                              //             90, 12, 20, 7),
                                              //     child: Text(
                                              //       "${snapshot.data!.astrologers![index].firstName}",
                                              //       style:
                                              //           TextStyle(fontSize: 20),
                                              //     ),

                                              //   ),

                                              // ),
                                            ],
                                          ),
                                        ),
                                      );
                                    }),
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
}

var chatAvailStatus;
Color getcolor(String chatAvailStatus) {
  if (chatAvailStatus == 'Online') return Colors.blue;

  return Colors.green;
}

Color getmecolor() {
  if (chatAvailStatus == "Online") {
    return Color(0xFFFF9000);
  } else {
    return Color.fromARGB(255, 139, 215, 17);
  }
}
