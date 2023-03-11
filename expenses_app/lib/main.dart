import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(title: "Flutter App", home: MyHomePage());
  }
}

class MyHomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Flutter App"),
        ),
        body: Column(
          children: [
            Container(
                child: Card(
                  child: Container(child: Text("Chart")),
                  color: Colors.blue,
                ),
                width: double.infinity,
                color: Colors.blue),
            Card(
              child: Text('List of Cards'),
            )
          ],
        ));
  }
}
