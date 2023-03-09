import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  void answerQuestion() {
    print("pressed");
  }

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
          ElevatedButton(
              onPressed: answerQuestion, child: Text("Click me baby")),
        ]),
      ),
    );
  }
}
