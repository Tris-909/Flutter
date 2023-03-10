import 'package:flutter/material.dart';
import './textcontrol.dart';
import './text.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => MyAppState();
}

class MyAppState extends State<MyApp> {
  int currentAppState = 1;

  changeAppState() {
    if (currentAppState == 1) {
      setState(() {
        currentAppState = 2;
      });
    } else {
      setState(() {
        currentAppState = 1;
      });
    }
  }

  String get differentText {
    if (currentAppState == 1) {
      return "TEST";
    } else {
      return "DONE";
    }
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
          appBar: AppBar(title: Text("Flutter basics TEST")),
          body: Container(
            child: Column(children: [
              ActualText(text: differentText),
              TextControl(
                handler: changeAppState,
              ),
            ]),
          )),
    );
  }
}
