import 'dart:math';

import 'package:flutter/material.dart';
import './placeholder.dart';
import './button.dart';

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _MyAppState();
  }
}

class _MyAppState extends State<MyApp> {
  num _count = 0;
  int result = 0;
  final listOfButtons = [
    {"text": "Increment"},
    {"text": "Decrement"},
    {"text": "Multiply By 2"},
    {"text": "Divided By 2"},
  ];

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

  void _multiplyBy2() {
    setState(() {
      _count = _count * 2;
    });
  }

  void _dividedBy2() {
    setState(() {
      _count = (_count / 2);
    });
  }

  decideButtonFunc(buttonName) {
    if (buttonName == 'Increment') {
      _increment();
    } else if (buttonName == 'Decrement') {
      _decrement();
    } else if (buttonName == "Multiply By 2") {
      _multiplyBy2();
    } else {
      _dividedBy2();
    }
  }

  void initState() {
    super.initState();
    setState(() {
      result = new Random().nextInt(100);
    });
  }

  resetAppState() {
    setState(() {
      _count = 0;
      result = new Random().nextInt(100);
    });
  }

  String get getEmotion {
    var emotion;
    if (_count > 50) {
      emotion = "SUPAR HOT";
    } else if (_count <= 50 && _count > 0) {
      emotion = "MEH";
    } else if (_count <= 0 && _count >= -10) {
      emotion = "COLDDD";
    } else {
      emotion = "...";
    }
    return emotion;
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(title: Text("Flutter basics")),
        body: Column(
          children: [
            Counter(text: "Current count: ", counter: _count),
            Text("Result $result"),
            if (_count == result)
              Text(
                "YOU WIN",
                style: TextStyle(fontSize: 28, color: Colors.red),
              ),
            Text(getEmotion,
                style: TextStyle(fontSize: 20, color: Colors.blue)),
            ...listOfButtons
                .map((button) => new Button(
                    handler: () => decideButtonFunc(button["text"]),
                    text: button["text"] as String))
                .toList(),
            Container(
              child: ElevatedButton(
                onPressed: resetAppState,
                child: Text("Reset"),
                style: ButtonStyle(
                  backgroundColor:
                      MaterialStateProperty.all<Color>(Colors.green),
                ),
              ),
              width: double.infinity,
              margin: EdgeInsets.all(50),
            )
          ],
        ),
      ),
    );
  }
}
