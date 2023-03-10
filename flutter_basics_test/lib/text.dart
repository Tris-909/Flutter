import 'package:flutter/material.dart';

class ActualText extends StatelessWidget {
  final String text;

  const ActualText({required this.text});

  @override
  Widget build(BuildContext context) {
    return Text(text);
  }
}
