import 'package:flutter/material.dart';

class Counter extends StatelessWidget {
  final num? counter;
  final String? text;

  Counter({this.counter, this.text});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Text(
        "$text $counter",
        style: TextStyle(fontSize: 28),
        textAlign: TextAlign.center,
      ),
      width: double.infinity,
      margin: EdgeInsets.all(50),
    );
  }
}
