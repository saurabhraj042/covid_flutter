import 'package:flutter/material.dart';
import 'package:test_app/charts/barChart.dart';
import 'package:test_app/models/barchartData.dart';
import 'package:charts_flutter/flutter.dart' as charts;

var textStyle = TextStyle(fontSize: 20, fontWeight: FontWeight.bold);

class PanelTwo extends StatelessWidget {
  final Map indiaData;

  const PanelTwo({Key key, this.indiaData}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;

    var deaths = indiaData['deaths'];
    var recv = indiaData['recovered'];
    int tc = indiaData['cases'];

    var mortalityRate = (deaths) / (deaths + recv) * 100;
    mortalityRate = num.parse(mortalityRate.toStringAsFixed(2));

    double recoveryRate = (indiaData['recovered'] / (deaths + recv)) * 100;
    recoveryRate = num.parse(recoveryRate.toStringAsFixed(2));

    List<BarData> data = [
      BarData(
        mortalityRate.toInt(),
        charts.ColorUtil.fromDartColor(Colors.red),
        tc.toString(),
      ),
      BarData(
        recoveryRate.toInt(),
        charts.ColorUtil.fromDartColor(Colors.green),
        tc.toString(),
      ),
    ];

    return Container(
      child: SizedBox(
        height: height / 2,
        width: width,
        child: Card(
          margin: const EdgeInsets.all(20),
          color: Colors.white,
          elevation: 10,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[BarChart(data: data,),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  Text(
                    "Mortality Rate",
                    style: textStyle,
                  ),
                  Text(
                    mortalityRate.toString() + " %",
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: Colors.grey[600],
                    ),
                  )
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  Text(
                    "Recovery Rate",
                    style: textStyle,
                  ),
                  Text(
                    recoveryRate.toString() + " %",
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: Colors.green[500],
                    ),
                  )
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
