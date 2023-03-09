import 'package:flutter/material.dart';
import './placeholder.dart';

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _MyAppState();
  }
}

class _MyAppState extends State<MyApp> {
  var _count = 0;

  void _increment() {
    setState(() {
      _count++;
    });
  }

  void _decrement() {
    setState(() {
      _count--;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(title: Text("Flutter basics")),
        body: Column(
          children: [
            Counter(text: "Current count: ", counter: _count),
            ElevatedButton(onPressed: _increment, child: Text('Increment')),
            ElevatedButton(onPressed: _decrement, child: Text('Decrement')),
          ],
        ),
      ),
    );
  }
}
