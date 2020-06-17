import 'package:flutter/cupertino.dart';
import 'package:charts_flutter/flutter.dart' as charts;
import 'package:test_app/models/barchartData.dart';

class BarChart extends StatelessWidget {
  final List<BarData> data;

  const BarChart({Key key, this.data}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    List<charts.Series<BarData, String>> series = [
      charts.Series(
        id: "BarChart",
        data: data,
        domainFn: (BarData series, _) => series.tc,
        measureFn: (BarData series, _) => series.no,
        colorFn: (BarData series, _) => series.color,
      ),
    ];

    return Expanded(child: charts.BarChart(series,animate: true,),);
  }
}
