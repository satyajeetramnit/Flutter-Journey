import 'package:flutter/material.dart';
import 'package:list_and_chart/fruit_prices.dart';
import 'package:charts_flutter/flutter.dart' as chart;
import 'package:list_and_chart/lifeCycle.dart';
import 'fruit_prices_chart.dart';

void main() {
  runApp(const MaterialApp(
    home: LifeCycle(),
  ));
}

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    List<FruitPrices> data = [
      FruitPrices(
          fruit: 'Apple',
          price: 100,
          barColor: chart.ColorUtil.fromDartColor(Colors.red)),
      FruitPrices(
          fruit: 'Banana',
          price: 200,
          barColor: chart.ColorUtil.fromDartColor(Colors.yellow)),
      FruitPrices(
          fruit: 'Mango',
          price: 300,
          barColor: chart.ColorUtil.fromDartColor(Colors.green)),
      FruitPrices(
          fruit: 'Orange',
          price: 400,
          barColor: chart.ColorUtil.fromDartColor(Colors.orange)),
      FruitPrices(
          fruit: 'Elderberry',
          price: 500,
          barColor: chart.ColorUtil.fromDartColor(Colors.purple)),
    ];
    return Scaffold(
      appBar: AppBar(
        title: const Text('Fruits and Charts'),
        backgroundColor: Colors.red[300],
        centerTitle: true,
      ),
      body: Column(
        children: [
          FruitPricesChart(data: data),
          SizedBox(
              height: 200,
              child: ListView.builder(
                  itemCount: data.length,
                  itemBuilder: (BuildContext context, int index) {
                    return Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 10.0, vertical: 5.0),
                        child: Card(
                          child: Center(
                            child: Text(
                              data[index].fruit,
                              style: TextStyle(
                                fontSize: 20,
                                color: Colors.white,
                              ),
                            ),
                          ),
                          color: Colors.red[300],
                        ));
                  })),
        ],
      ),
    );
  }
}
