import 'package:charts_flutter/flutter.dart' as chart;
import 'package:flutter/material.dart';
import 'package:list_and_chart/fruit_prices.dart';

class FruitPricesChart extends StatelessWidget {
  // const FruitPricesChart({Key? key}) : super(key: key);

  final List<FruitPrices> data;
  FruitPricesChart({required this.data});

  @override
  Widget build(BuildContext context) {
    List<chart.Series<FruitPrices, String>> series = [
      chart.Series(
        id: 'Price',
        data: data,
        domainFn: (FruitPrices series, _) => series.fruit,
        measureFn: (FruitPrices series, _) => series.price,
        colorFn: (FruitPrices series, _) => series.barColor,
      )
    ];
    return Container(
        height: 400,
        padding: EdgeInsets.all(20),
        child: Card(
            child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: <Widget>[
              Text('Fruit prices this quarter:'),
              Expanded(
                  // child: chart.BarChart(
                  child: chart.PieChart(
                series,
                animate: true,
                animationDuration: Duration(seconds: 1),
              )),
            ],
          ),
        )));
  }
}
