import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

class LifeCycle extends StatefulWidget {
  const LifeCycle({Key? key}) : super(key: key);

  @override
  State<LifeCycle> createState() => _LifeCycleState();
}

class _LifeCycleState extends State<LifeCycle> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title:
            const Text('LifeCycle Demo', style: TextStyle(color: Colors.white)),
        backgroundColor: Colors.purple[300],
        centerTitle: true,
      ),
      body: Center(
        child: TextButton(
          child: Text('Show Toast'),
          onPressed: () {
            print('Build()');
            Fluttertoast.showToast(
              msg: 'Called from build() mathod',
              backgroundColor: Colors.purple[100],
              textColor: Colors.black87,
              toastLength: Toast.LENGTH_LONG,
              fontSize: 15,
              gravity: ToastGravity.TOP,
            );
          },
          // child: Text('Raise a Toast),
        ),
      ),
    );
  }
}
