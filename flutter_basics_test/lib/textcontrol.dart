import 'package:flutter/material.dart';

class TextControl extends StatelessWidget {
  final Function handler;

  const TextControl({required this.handler});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
        onPressed: () => handler(), child: Text("Click me baby !"));
  }
}
