import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:test_app/panels/subPanelsStateWise/panelStatwise.dart';

class SecondRoute extends StatefulWidget {
  @override
  _SecondRouteState createState() => _SecondRouteState();
}

class _SecondRouteState extends State<SecondRoute> {
  Map stateData;
  List stateWise;
  fetchStateData() async {
    http.Response response =
        await http.get('https://api.covid19india.org/data.json');
    setState(() {
      stateData = json.decode(response.body);
      stateWise = stateData['statewise'];
    });
  }

  @override
  void initState() {
    fetchStateData();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: Text(
          "StateWise-Data",
          style: TextStyle(
            fontWeight: FontWeight.bold,
            letterSpacing: 2,
            fontSize: 20,
          ),
        ),
      ),
      body: (stateWise == null)
          ? Container(
              child: Center(
                child: CircularProgressIndicator(
                  strokeWidth: 8,
                ),
              ),
            )
          : StateWise(
              data: stateWise,
            ),
    );
  }
}
