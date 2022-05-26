import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

void main() {
  runApp(const MaterialApp(
    home: HomePage(),
  ));
}

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int currentIndex = 0;
  int height = 150;
  int weight = 50;
  String finalBMI = '';

  void changeIcon(int index) {
    setState(() {
      currentIndex = index;
    });
  }

  Widget radioButton(Icon icon, Color iconColor, int index) {
    return Expanded(
      child: Container(
        margin: const EdgeInsets.symmetric(horizontal: 20),
        color: currentIndex == index ? iconColor : Colors.transparent,
        child: IconButton(
          icon: icon,
          iconSize: 40,
          focusColor: currentIndex == index ? Colors.white : iconColor,
          onPressed: () {
            changeIcon(index);
          },
        ),
      ),
    );
  }

  String bmiCalculation() {
    double result = weight / ((height / 100) * (height / 100));
    String b = result.toStringAsFixed(2);
    String bmi = '';
    if (result >= 25) {
      bmi = 'Overweight: \nYou have a higher than normal body weight. Try to exercise more!';
    } else if (result > 18.5) {
      bmi = 'Normal: \nYou have a normal body weight. Good job!';
    } else {
      bmi = 'Underweight: \nYou have a lower than normal body weight. You can eat a bit more!';
    }
    finalBMI="Your BMI is $b,\n$bmi";
    return finalBMI;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('BMI Calculator'),
        centerTitle: true,
        backgroundColor: Colors.teal,
        actions: [
          IconButton(
            icon: const Icon(Icons.refresh),
            onPressed: () {
              Fluttertoast.showToast(
                msg: "Refreshed",
                toastLength: Toast.LENGTH_SHORT,
                gravity: ToastGravity.BOTTOM,
                timeInSecForIosWeb: 1,
                backgroundColor: Colors.teal,
                textColor: Colors.white,
                fontSize: 16.0
              );
              setState(() {
                currentIndex = 0;
                height = 150;
                weight = 50;
                finalBMI = '';
              });
            },
          ),
          IconButton(
            onPressed: (){
              //TODO : Set Alarm
              Fluttertoast.showToast(
                msg: "Alarm Set",
                toastLength: Toast.LENGTH_SHORT,
                gravity: ToastGravity.BOTTOM,
                timeInSecForIosWeb: 1,
                backgroundColor: Colors.teal,
                textColor: Colors.white,
                fontSize: 16.0
              );
            }, 
            icon: const Icon(
              Icons.alarm,
              color: Colors.white,
              )
            ),
        ],
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(10),
        child: Column(
          children: [
            Row(
              children:[
                radioButton(const Icon(Icons.male_sharp),Color.fromARGB(90, 16, 140, 140) ,0),
                radioButton(const Icon(Icons.female_sharp), Color.fromARGB(79, 255, 64, 128), 1),
              ]
            ),

            const SizedBox(
              height: 30,
            ),

            Row(
              children: [
                const Text(
                  'Height in CM: ',
                  style: TextStyle(
                    fontSize: 20,
                    // fontWeight: FontWeight.bold,
                  ),
                ),
                Text(
                  height.toString(),
                  style: const TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                )
              ],
            ),

            SliderTheme(
              data: SliderTheme.of(context).copyWith(
                activeTrackColor: Colors.teal,
                inactiveTrackColor: Colors.grey[300],
                thumbColor: Colors.teal[300],
                overlayColor: Colors.teal[100],
                thumbShape: const RoundSliderThumbShape(enabledThumbRadius: 10),
                overlayShape: const RoundSliderOverlayShape(overlayRadius: 25),
              ),
              child: Slider(
                onChanged: (double value) {
                  setState(() {
                    height = value.round();
                  });
                },
                value: height.toDouble(),
                min: 120,
                max: 220,
              )
            ),

            Row(
              children: [
                const Text(
                  'Weight in KG: ',
                  style: TextStyle(
                    fontSize: 20,
                    // fontWeight: FontWeight.bold,
                  ),
                ),
                Text(
                  weight.toString(),
                  style: const TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                )
              ],
            ),

            SliderTheme(
              data: SliderTheme.of(context).copyWith(
                activeTrackColor: Colors.teal,
                inactiveTrackColor: Colors.grey[300],
                thumbColor: Colors.teal[300],
                overlayColor: Colors.teal[100],
                thumbShape: const RoundSliderThumbShape(enabledThumbRadius: 10),
                overlayShape: const RoundSliderOverlayShape(overlayRadius: 25),
              ),
              child: Slider(
                onChanged: (double value) {
                  setState(() {
                    weight = value.round();
                  });
                },
                value: weight.toDouble(),
                min: 30,
                max: 180,
              )
            )
          ]
        ),
      ),
    );
  }
}
