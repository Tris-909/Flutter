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
  var _count = 0 as num;
  var listOfButtons = [
    {"text": "Increment"},
    {
      "text": "Decrement",
    },
    {"text": "Multiply By 2"},
    {"text": "Divided By 2"}
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

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(title: Text("Flutter basics")),
        body: Column(
          children: [
            Counter(text: "Current count: ", counter: _count),
            ...listOfButtons
                .map((button) => new Button(
                    handler: () => decideButtonFunc(button["text"]),
                    text: button["text"]))
                .toList()
          ],
        ),
      ),
    );
  }
}
