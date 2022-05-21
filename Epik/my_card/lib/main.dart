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
  int _salary=150;
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(

      // NavBar :-
      appBar: AppBar(
        title: Text('My Profile'),
        centerTitle: true,
        backgroundColor: Colors.green[200],
      ),
      
      // Body :-
      body: Column(
        children: [
          SizedBox(
            height: 20,
          ),
          
          // Profile Image :-
          Center(
            child: CircleAvatar(
              radius: 100,
              backgroundImage: AssetImage('images/Satyajeet.jpeg'),
            ),
          ),
          
          Divider(
            height: 40,
            color: Colors.green[200],
            thickness: 1,
          ),

          // Name :-
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: Row(
              children: [
                Expanded(
                  flex:1,
                  child: Text("Name", style: TextStyle(color: Colors.green[900], fontSize: 20, fontWeight: FontWeight.bold),),
                ),
                Expanded(
                  flex:2,
                  child: Text("Satyajeet Ramnit", style: TextStyle(fontSize: 20),),
                ),
              ],
            ),
          ),

          // Email :-
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: Row(
              children: [
                Expanded(
                  flex:1,
                  child: Text("Email", style: TextStyle(color: Colors.green[900], fontSize: 20, fontWeight: FontWeight.bold),),
                ),
                Expanded(
                  flex:2,
                  child: Text("1906130@kiit.ac.in", style: TextStyle(decoration: TextDecoration.underline ,color: Colors.blueGrey, fontSize: 20),),
                ),
              ],
            ),
          ),

          // Salary :-
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: Row(
              children: [
                Expanded(
                  flex:1,
                  child: Text("Salary", style: TextStyle(color: Colors.green[900], fontSize: 20, fontWeight: FontWeight.bold),),
                ),
                Expanded(
                  flex:2,
                  child: Text("$_salary INR", style: TextStyle(fontSize: 20),),
                ),
              ],
            ),
          ),
        ],
      ),

      // floatingActionButton: FloatingActionButton(
      //   onPressed: (){
      //     setState(() {
      //       _salary+=100;
      //     });
      //   },
      //   child: Icon(Icons.add),
      //   backgroundColor: Colors.green[200],
      // ),
      
      // Multiple Floating Button
      floatingActionButton: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          // Adding Salary
          FloatingActionButton(
            onPressed: (){
              setState(() {
                _salary+=100;
              });
            },
            child: Icon(Icons.add),
            backgroundColor: Colors.green[200],
          ),
          
          SizedBox(
            height: 10,
          ),
          
          // Adding Salary
          FloatingActionButton(
            onPressed: (){
              setState(() {
                _salary-=100;
              });
            },
            child: Icon(Icons.remove),
            backgroundColor: Colors.green[200],
          ),
        ],
      ),
    );
  }
}