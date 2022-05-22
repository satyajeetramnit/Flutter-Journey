import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(
    home: HomePage(),
  ));
}

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _value=100;
  Color _colorContainer = Colors.blue;
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(

      // NavBar :-
      appBar: AppBar(
        title: Text('Assignment 21.05.2022'),
        centerTitle: true,
        backgroundColor: Colors.deepPurple[200],
      ),
      
      // Body :-
      body: Column(
        children: [
          SizedBox(
            height: 20,
          ),
          
          // Changing color of Container with a button:-
          Container(
            height: 100,
            width: double.infinity,
            color: _colorContainer,
          ),
          
          SizedBox(
            height: 10,
          ),

          ElevatedButton(
            onPressed: () {
              setState(() {
                _colorContainer = _colorContainer == Colors.red ? 
                    Colors.blue : 
                    Colors.red;
              });
            },
            child: Text('Change Color'),
          ),

          SizedBox(
            height: 100,
          ),

          // Value :-
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: Row(
              children: [
                Expanded(
                  flex:3,
                  child: Text(" Curr. Value", style: TextStyle(color: Colors.green[900], fontSize: 20, fontWeight: FontWeight.bold),),
                ),
                Expanded(
                  flex:4,
                  child: Text("$_value", style: TextStyle(fontSize: 20),),
                ),
              ],
            ),
          ),
        ],
      ),

      // Multiple Floating Button
      floatingActionButton: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          // Adding value
          FloatingActionButton(
            onPressed: (){
              setState(() {
                _value+=100;
              });
            },
            child: Icon(Icons.add),
            backgroundColor: Colors.deepPurple[200],
          ),
          
          SizedBox(
            height: 10,
          ),
          
          // Substracting value
          FloatingActionButton(
            onPressed: (){
              setState(() {
                _value-=100;
              });
            },
            child: Icon(Icons.remove),
            backgroundColor: Colors.deepPurple[200],
          ),
        ],
      ),
    );
  }
}