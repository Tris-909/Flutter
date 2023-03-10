import 'package:flutter/material.dart';

class Button extends StatelessWidget {
  final Function? handler;
  final String? text;

  Button({this.handler, this.text});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: ElevatedButton(
        onPressed: () => handler!(),
        child: Text(
          text!,
          style: TextStyle(color: Colors.white),
        ),
        style: ButtonStyle(
          backgroundColor: MaterialStateProperty.all<Color>(Colors.pink),
        ),
      ),
      width: double.infinity,
    );
  }
}
