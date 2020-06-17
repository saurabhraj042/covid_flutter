import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:test_app/panels/panelThree.dart';
import 'package:test_app/panels/panelTwo.dart';
import 'panels/midPanel.dart';
import 'package:http/http.dart' as http;

var text = RichText(
  text: TextSpan(
    children: <TextSpan>[
      TextSpan(
          text: "Covid",
          style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
            letterSpacing: 2,
            fontSize: 20,
          )),
      TextSpan(
          text: "Status",
          style: TextStyle(
            color: Colors.blue,
            fontSize: 20,
            letterSpacing: 2,
            fontWeight: FontWeight.bold,
          ))
    ],
  ),
);

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  Map indiaData;
  fetchIndiaData() async {
    http.Response response =
        await http.get('https://corona.lmao.ninja/v2/countries/IND');

    setState(() {
      indiaData = json.decode(response.body);
    });
  }

  @override
  void initState() {
    fetchIndiaData();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 20,
        centerTitle: true,
        backgroundColor: Colors.black,
        title: text,
      ),
      body: Container(
        margin: const EdgeInsets.all(10),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              indiaData == null
                  ? CircularProgressIndicator()
                  : MiddlePanel(
                      indiaData: indiaData,
                    ),
              indiaData == null
                  ? CircularProgressIndicator()
                  : PanelTwo(
                      indiaData: indiaData,
                    ),
              PanelThree(),
            ],
          ),
        ),
      ),
    );
  }
}
