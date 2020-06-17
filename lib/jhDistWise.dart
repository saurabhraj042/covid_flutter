import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:test_app/models/cities.dart';

class DistrictJh extends StatefulWidget {
  @override
  _DistrictJhState createState() => _DistrictJhState();
}

class _DistrictJhState extends State<DistrictJh> {
  Map jhDist;
  Map bhData;
  Map jhData;
  var data2 = <Cities>[];

  fetchJhDist() async {
    http.Response response =
        await http.get('https://api.covid19india.org/state_district_wise.json');
    setState(() {
      bhData = json.decode(response.body);
      jhDist = bhData['Bihar']['districtData'];
      jhData = bhData['Bihar']['districtData']['Patna'];
    });

    data2.add(new Cities("PTN", (jhData['confirmed'].toString())));
    data2.add(new Cities("BGP", (jhDist['Bhagalpur']['confirmed'].toString())));
  }

  @override
  void initState() {
    fetchJhDist();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.black,
          title: Text(
            "Jh-Data",
            style: TextStyle(
              fontWeight: FontWeight.bold,
              letterSpacing: 2,
              fontSize: 20,
            ),
          ),
        ),
        body: (data2 == null)
            ? Container(
                child: Center(
                  child: CircularProgressIndicator(
                    strokeWidth: 8,
                  ),
                ),
              )
            : Container(
                child: ListView.builder(
                    itemCount: data2.length,
                    itemBuilder: (BuildContext context, int index) {
                      return ListTile(
                        title: SizedBox(
                          height: 70,
                          child: Card(
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: <Widget>[
                                Text(data2[index].cityName),
                                Text(data2[index].cases)
                              ],
                            ),
                          ),
                        ),
                      );
                    }),
              ));
  }
}
