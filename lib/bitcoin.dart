import 'dart:convert';

import 'package:astrology/Models/bitcoin_model.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class Bitcoin extends StatefulWidget {
  const Bitcoin({Key? key}) : super(key: key);

  @override
  State<Bitcoin> createState() => _BitcoinState();
}

class _BitcoinState extends State<Bitcoin> {
  Map? data;
  Future<BitCoinModel> fetchData() async {
    BitCoinModel bm;

    String url = "https://api.coindesk.com/v1/bpi/currentprice.json";
    http.Response response = await http.get((Uri.parse(url)));
    Map<String, dynamic> jsonreponse = json.decode(response.body);
    bm = BitCoinModel.fromJson(jsonreponse);

    return bm;
  }

  @override
  void initState() {
    fetchData();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
            child: FutureBuilder<BitCoinModel>(
      future: fetchData(),
      builder: (context, AsyncSnapshot<BitCoinModel> snapshot) {
        if (!snapshot.hasData) {
          return Center(
            child: CircularProgressIndicator(),
          );
        }
        final data = snapshot.data!;
        return Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: [
              myCards("${data.time!.updated}", Colors.amber),
              myCards("${data.disclaimer}", Colors.limeAccent),
              Row(
                children: [
                  Text("Euro"),
                  Expanded(
                      child:
                          myCards("${data.bpi!.eur!.rate}", Colors.pinkAccent))
                ],
              ),
              Row(
                children: [
                  Text("GBP"),
                  Expanded(
                      child:
                          myCards("${data.bpi!.gbp!.rate}", Colors.deepOrange))
                ],
              ),
              Row(
                children: [
                  Text("USD"),
                  Expanded(
                      child:
                          myCards("${data.bpi!.usd!.rate}", Colors.lightGreen))
                ],
              )
            ],
          ),
        );
      },
    )));
  }

  Container myCards(String text, Color c) {
    return Container(
      width: double.infinity,
      child: Padding(
        padding: EdgeInsets.all(8),
        child: Card(
          color: c,
          child: Padding(
            padding: EdgeInsets.all(15),
            child: Text("$text"),
          ),
        ),
      ),
    );
  }
}
