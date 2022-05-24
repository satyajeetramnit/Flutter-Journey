import 'package:flutter/material.dart';
import 'package:audioplayers/audioplayers.dart';

void main() {
  runApp(const MaterialApp(
    home: Xylophone(),
  ));
}

class Xylophone extends StatefulWidget {
  const Xylophone({Key? key}) : super(key: key);

  @override
  State<Xylophone> createState() => _XylophoneState();
}

class _XylophoneState extends State<Xylophone> {
  final player = AudioCache();

  // void playSound(int soundNumber) {
  //   final player = AudioCache();
  //   player.play('note$soundNumber.wav');
  // }
  
  Widget soundTiles(
      {Color color = Colors.white, String sur = 'sa', String x = '1'}) {
    return OutlinedButton(
        onPressed: (){
          player.play('note$x.wav');
          // playSound(x);
        },
        style: ButtonStyle(
          backgroundColor: MaterialStateProperty.all(color),
          fixedSize: MaterialStateProperty.all<Size>(Size(00,115)),
        ),
        child: Text(
          sur,
          style: TextStyle(color: Colors.white),
        ));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
        soundTiles(x: '1',color: Colors.purple, sur: 'Sa'),
        soundTiles(x: '2',color: Colors.indigo, sur: 'Re'),
        soundTiles(x: '3',color: Colors.blue, sur: 'Ga'),
        soundTiles(x: '4',color: Colors.green, sur: 'Ma'),
        soundTiles(x: '5',color: Colors.yellow, sur: 'Pa'),
        soundTiles(x: '6',color: Colors.orange, sur: 'Dha'),
        soundTiles(x: '7',color: Colors.red, sur: 'Ni'),
      ],)
    );
  }
}