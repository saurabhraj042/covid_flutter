import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:test_app/jhDistWise.dart';
import 'package:test_app/statewise.dart';

class PanelThree extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;

    return Container(
      margin: const EdgeInsets.only(top: 10),
      height: 100,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        // crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          SizedBox(
            height: 70,
            width: (width / 2) - 20,
            child: RaisedButton(
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10.0),
                  side: BorderSide(color: Colors.white)),
              elevation: 10,
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => DistrictJh()),
                );
              },
              color: Colors.white,
              child: Text("JH-dist"),
            ),
          ),
          SizedBox(
            height: 70,
            width: (width / 2) - 20,
            child: RaisedButton(
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10.0),
                  side: BorderSide(color: Colors.white)),
              elevation: 10,
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => SecondRoute()),
                );
              },
              color: Colors.white,
              child: Text("StateWise"),
            ),
          )
        ],
      ),
    );
  }
}
