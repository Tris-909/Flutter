import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return MyAppState();
  }
}

class MyAppState extends State<MyApp> {
  var count = 0;

  void increment() {
    setState(() {
      count++;
    });
  }

  void decrease() {
    setState(() {
      count--;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text("My first app"),
        ),
        body: Column(children: [
          Text("$count"),
          ElevatedButton(onPressed: increment, child: Text("increment")),
          ElevatedButton(onPressed: decrease, child: Text('decrease'))
        ]),
      ),
    );
  }
}
