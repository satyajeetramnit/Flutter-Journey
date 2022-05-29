import 'package:flutter/material.dart';

class BottomButton extends StatelessWidget {
  final Function onTap;
  final String buttonTitle;

  BottomButton({required this.onTap, required this.buttonTitle});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap(),
      child: Container(
        child: Center(child: Text(buttonTitle, style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold))),
        color: Colors.teal[200],
        margin: EdgeInsets.only(top: 10.0),
        padding: EdgeInsets.all(8.0),
        width: double.infinity,
        height: 40.0,
      )
    );
  }
}