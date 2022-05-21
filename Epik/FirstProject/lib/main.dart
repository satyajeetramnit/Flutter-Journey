import 'package:flutter/material.dart';

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
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Home Page'),
        backgroundColor: Colors.blue[400],
      ),
      // body: Center(
      //   // For Text :-
      //   // child: Text('Ju-Leh'),

      //   // For Image (Method 1):-
      //   // child: Image(
      //   //   // image: NetworkImage("https://i.imgur.com/6iDqKBz.jpeg"),
      //   //   image: AssetImage("images/2.png"),
      //   //   ),

      //   // Method 2 :-
      //   // child: Image.asset("images/2.png"),
      //   // child: Image.network("https://i.imgur.com/6iDqKBz.jpeg"),

      //   // For Button :-
      //   // child: ElevatedButton(
      //   //   onPressed: () {},
      //   //   child: const Text("Submit"),
      //   // ),

      //   // For Button Icon :-
      //   // child: ElevatedButton.icon(
      //   //   onPressed: () {},
      //   //   icon: const Icon(Icons.add),
      //   //   label: const Text("Add"),
      //   // ),

      //   // For IconButton:-
      //   // child: IconButton(
      //   //   icon: const Icon(Icons.add),
      //   //   color: Colors.blue[400],
      //   //   onPressed: () {},
      //   // ),

      //   // child: Container(
      //   //   // width: 400,
      //   //   // height: 400,

      //   //   // Inside the Container :-
      //   //   // padding:  const EdgeInsets.all(20),
      //   //   // padding: const EdgeInsets.fromLTRB(10, 20, 30, 40),
      //   //   // padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 10),
      //   //   // padding: const EdgeInsets.only(top: 20, bottom: 20, left: 10, right: 10),
          
      //   //   // Outside the container :-
      //   //   // margin: const EdgeInsets.all(20),
      //   //   // margin: const EdgeInsets.fromLTRB(10, 20, 30, 40),
      //   //   // margin: const EdgeInsets.symmetric(vertical: 20, horizontal: 10),
      //   //   // margin: const EdgeInsets.only(top: 20, bottom: 20, left: 10, right: 10),

      //   //   color: Colors.pink[300],
      //   //   child: const Padding(
      //   //     padding: EdgeInsets.all(8.0),
      //   //     child: Text("Ju-Leh"),
      //   //   ),
      //   // ),

      //   // For Row :-
      //   // child: Row(
      //   //   mainAxisAlignment: MainAxisAlignment.spaceAround,
      //   //   crossAxisAlignment: CrossAxisAlignment.center,
      //   //   children: [
      //   //     const Text("Hello"),
      //   //     TextButton(onPressed: () {}, child: const Text("Add")),
      //   //     IconButton(
      //   //       icon: const Icon(Icons.add),
      //   //       color: Colors.blue[400],
      //   //       onPressed: () {},
      //   //     ),
      //   //   ],
        
      //   // For Column :-
      //   // child: Column(
      //   //   mainAxisAlignment: MainAxisAlignment.spaceAround,
      //   //   crossAxisAlignment: CrossAxisAlignment.center,
      //   //   children: [
      //   //     Container(
      //   //       height: 100,
      //   //       width: 100,
      //   //       color: Colors.pink[300],
      //   //     ),
      //   //     const Text("Hello"),
      //   //     TextButton(onPressed: () {}, child: const Text("Add")),
      //   //     IconButton(
      //   //       icon: const Icon(Icons.add),
      //   //       color: Colors.blue[400],
      //   //       onPressed: () {},
      //   //     ),
      //   //   ],
      //   // ),

      //   // For Nested Row and colum :-
      //   child: Column(
      //     mainAxisAlignment: MainAxisAlignment.spaceAround,
      //     crossAxisAlignment: CrossAxisAlignment.center,
      //     children: [
      //       Row(
      //         mainAxisAlignment: MainAxisAlignment.spaceAround,
      //         crossAxisAlignment: CrossAxisAlignment.center,
      //         children: [
      //           Container(
      //             height: 100,
      //             width: 100,
      //             color: Colors.pink[300],
      //           ),
      //           const Text("Hello"),
      //           TextButton(onPressed: () {}, child: const Text("Add")),
      //           IconButton(
      //             icon: const Icon(Icons.add),
      //             color: Colors.blue[400],
      //             onPressed: () {},
      //           ),
      //         ],
      //       ),
      //       Container(
      //         height: 100,
      //         width: 100,
      //         color: Colors.pink[300],
      //       ),
      //       const Text("Hello"),
      //       TextButton(onPressed: () {}, child: const Text("Add")),
      //       IconButton(
      //         icon: const Icon(Icons.add),
      //         color: Colors.blue[400],
      //         onPressed: () {},
      //       ),
      //     ],
      //   ),
      // ),

      // Day 2 :-
      // For Expanded :-
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            flex: 1,
            child: Container(
              // height: 100,
              // width: 100,
              color: Colors.pink[300],
            ),
          ),
          Expanded(
            flex: 2,
            child: Container(
              // height: 100,
              // width: 100,
              color: Colors.amber,
            ),
          ),
          Expanded(
            flex: 6,
            child: Container(
              // height: 100,
              // width: 100,
              color: Colors.black,
            ),
          ),
          Expanded(
            flex: 6,
            child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
            Expanded(
              flex: 2,
              child: Container(
                // height: 100,
                // width: 100,
                color: Colors.pink[300],
              ),
            ),
            Expanded(
              flex: 1,
              child: Container(
                // height: 100,
                // width: 100,
                color: Colors.amber,
              ),
            ),
            Expanded(
              flex: 3,
              child: Container(
                // height: 100,
                // width: 100,
                color: Colors.black,
              ),
            ),
          ],
        ),
      ),
        ],
      ),
    );
  }
}
