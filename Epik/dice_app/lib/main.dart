import 'dart:math';

import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(
    home: Dice(),
  ));
}

class Dice extends StatefulWidget {
  const Dice({Key? key}) : super(key: key);

  @override
  State<Dice> createState() => _DiceState();
}

class _DiceState extends State<Dice> {
  int leftDiceNumber = 1;
  int rightDiceNumber = 1;

  Roll1() {
    setState(() {
      leftDiceNumber = Random().nextInt(6) + 1;
    });
  }

  Roll2() {
    setState(() {
      rightDiceNumber = Random().nextInt(6) + 1;
    });
  }

  Roll() {
    setState(() {
      leftDiceNumber = Random().nextInt(6) + 1;
      rightDiceNumber = Random().nextInt(6) + 1;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Roll Dice'),
          centerTitle: true,
          backgroundColor: Colors.grey,
        ),
        
        body: Center(
          child: Column(children: [
            SizedBox(
              height: 20,
            ),
            
            OutlinedButton(
              onPressed: () {
                Roll1();
              },
              child: Image.asset(
                'images/dice$leftDiceNumber.png',
                fit: BoxFit.fitWidth,
                width: 300,
              ),
            ),
            
            SizedBox(
              height: 20,
            ),
            
            OutlinedButton(
              onPressed: () {
                Roll2();
              },
              child: Image.asset(
                'images/dice$rightDiceNumber.png',
                fit: BoxFit.fitWidth,
                width: 300,
              ),
            ),
            
            SizedBox(
              height: 20,
            ),
            
            RaisedButton(
              child: Text("Let's Roll"),
              onPressed: () {
                setState(() {
                  Roll();
                });
              },
            ),
          ]),
        ));
  }
}
