import 'package:flutter/material.dart';

class MiddlePanel extends StatelessWidget {
  final Map indiaData;

  const MiddlePanel({Key key, this.indiaData}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
        elevation: 10,
        color: Colors.white,
        child: Column(
          children: <Widget>[
            Padding(
                padding: const EdgeInsets.all(10),
                child: Text(
                  "NationWide",
                  style: TextStyle(fontWeight: FontWeight.w900, fontSize: 20),
                )),
            GridView(
              shrinkWrap: true,
              physics: NeverScrollableScrollPhysics(),
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2, childAspectRatio: 2),
              children: <Widget>[
                StatusPanel(
                  text: 'Confirmed',
                  count: indiaData['cases'].toString(),
                  panelColor: Colors.red[100],
                  textColor: Colors.red,
                ),
                StatusPanel(
                  text: 'Deaths',
                  count: indiaData['deaths'].toString(),
                  panelColor: Colors.grey[400],
                  textColor: Colors.grey[900],
                ),
                StatusPanel(
                  text: 'Recovered',
                  count: indiaData['recovered'].toString(),
                  panelColor: Colors.green[200],
                  textColor: Colors.green[900],
                ),
                StatusPanel(
                  text: 'Tests',
                  count: indiaData['tests'].toString(),
                  panelColor: Colors.blue[200],
                  textColor: Colors.blue[800],
                ),
              ],
            ),
          ],
        ));
  }
}

class StatusPanel extends StatelessWidget {
  final Color panelColor;
  final Color textColor;
  final String text;
  final String count;

  const StatusPanel(
      {Key key, this.panelColor, this.textColor, this.text, this.count})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;

    return Container(
      margin: EdgeInsets.all(10),
      height: 80,
      width: width / 2,
      color: panelColor,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Text(
            text,
            style: TextStyle(
                fontWeight: FontWeight.bold, fontSize: 16, color: textColor),
          ),
          Text(
            count,
            style: TextStyle(
                fontSize: 16, fontWeight: FontWeight.bold, color: textColor),
          )
        ],
      ),
    );
  }
}
