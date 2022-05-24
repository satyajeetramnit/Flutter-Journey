import 'dart:math';

import 'package:flutter/material.dart';

void main() {
  runApp(const MaterialApp(
    home: MagicBall(),
  ));
}

class MagicBall extends StatefulWidget {
  const MagicBall({Key? key}) : super(key: key);

  @override
  State<MagicBall> createState() => _MagicBallState();
}

class _MagicBallState extends State<MagicBall> {
  int ballNumber = 1;
  final textController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // SizedBox(
            //   height: 20,
            // ),
            TextField(
              controller: textController,
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                labelText: 'Ask a Question',
              ),
            ),
            
            // SizedBox(
            //   height: 10,
            // ),

            FlatButton(
              onPressed: () {},
              child: Text('Ask, and I will answer'),
            ),
            
            ElevatedButton(
              onPressed: () {
                if (textController.text.isEmpty) {
                  showDialog(
                      context: context,
                      builder: (context) {
                        return AlertDialog(
                          title: Text('Error'),
                          content: Text('Please enter a question..!'),
                          actions: [
                            FlatButton(
                              child: Text('OK'),
                              onPressed: () {
                                Navigator.of(context).pop();
                              },
                            )
                          ],
                        );
                      }
                    );
                }
                else {
                  setState(() {
                    ballNumber = Random().nextInt(5) + 1;
                    textController.text='';
                  });
                }
              },
              child: Image.asset('images/ball$ballNumber.png'),
            ),

            FlatButton(
              onPressed: () {},
              child: Text('Tap the above image to get your answer.'),
            ),

          ],
        ),
      // ),
    );
  }
}
