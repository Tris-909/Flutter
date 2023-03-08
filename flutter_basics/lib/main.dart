import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text("My first app"),
        ),
        body: Column(children: [
          Text('text 1'),
          Text('text 2'),
          ElevatedButton(onPressed: null, child: Text("Click me baby")),
        ]),
      ),
    );
  }
}
