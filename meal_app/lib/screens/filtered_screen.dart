import 'package:flutter/material.dart';

class FilteredScreen extends StatelessWidget {
  static String routeName = "/filtered_meals";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Filtered Meals'),
        ),
        body: Center(
          child: Text('abc'),
        ));
  }
}
