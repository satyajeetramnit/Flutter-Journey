import 'dart:async';
import 'dart:convert';

import 'package:cryptobase/coin_model.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:cryptobase/coin_card.dart';

void main() {
  runApp(const MaterialApp(
    home: Home(),
  ));
}

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  Future<List<Coin>> fetchcoin() async {
    coinList = [];
    final response = await http.get(Uri.parse(
        'https://api.coingecko.com/api/v3/coins/markets?vs_currency=usd&order=market_cap_desc&per_page=100&page=1&sparkline=false'));
    print("Response from API: $response");

    if (response.statusCode == 200) {
      List<dynamic> values = [];
      values = json.decode(response.body);
      print("JSON response: $values");
      if (values.length > 0) {
        for (int i = 0; i < values.length; i++) {
          if (values[i] != null) {
            Map<String, dynamic> mp = values[i];
            coinList.add(Coin.fromJSON(mp));
          }
        }
        setState(() {
          coinList;
        });
      }
      return coinList;
    }
    else{
      throw Exception('Failed to load coins!');
    }
  }

  @override
  void initState() {
    super.initState();
    fetchcoin();
    Timer.periodic(Duration(seconds: 15), (timer) {
      fetchcoin();
    });
  }

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Crypto Track', style: TextStyle(color: Colors.grey[800])),
        backgroundColor: Colors.grey[300],
        centerTitle: true,
      ),
      body: ListView.builder(
        scrollDirection: Axis.vertical,
        itemCount: coinList.length,
        itemBuilder: (context, index) {
          return CoinCard(
            name: coinList[index].name,
            symbol: coinList[index].symbol,
            imageUrl: coinList[index].imageUrl,
            price: coinList[index].price.toDouble(),
            change: coinList[index].change.toDouble(),
            changePercent: coinList[index].changePercent.toDouble(),
          );
        },
      )
    );
  }
}
