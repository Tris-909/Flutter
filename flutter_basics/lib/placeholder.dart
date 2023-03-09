import 'package:flutter/material.dart';

class Counter extends StatelessWidget {
  final int counter;
  final String text;

  Counter({this.counter, this.text});

  @override
  Widget build(BuildContext context) {
    return Text("$text $counter");
  }
}
