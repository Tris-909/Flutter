import 'package:flutter/material.dart';

class FilteredScreen extends StatefulWidget {
  static String routeName = "/filtered_meals";

  @override
  FilteredScreenState createState() => FilteredScreenState();
}

class FilteredScreenState extends State {
  bool glutenFree = false;
  bool vegetarianFree = false;
  bool vegan = false;
  bool lactoseFree = false;

  Widget buildOptionWidget(
      String title, String subTitle, bool switchValue, Function switchHandler) {
    return Padding(
        padding: EdgeInsets.all(20),
        child: ListTile(
          title: Text(
            title,
            style: TextStyle(fontSize: 22),
          ),
          subtitle: Text(
            subTitle,
            style: TextStyle(fontSize: 22, color: Colors.grey),
          ),
          trailing: Switch(
              value: switchValue,
              onChanged: (value) {
                switchHandler(value);
              }),
        ));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Filtered Meals'),
      ),
      body: Column(
        children: [
          Container(
            margin: EdgeInsets.all(20),
            child: Center(
              child: Text(
                "Adjust your meal selection.",
                style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
              ),
            ),
          ),
          buildOptionWidget(
            'Gluten-free',
            'Only include gluten-free meals',
            glutenFree,
            (newValue) {
              setState(() {
                glutenFree = newValue;
              });
            },
          ),
          buildOptionWidget(
            'Lactose-free',
            'Only include lactose-free meals',
            lactoseFree,
            (newValue) {
              setState(() {
                lactoseFree = newValue;
              });
            },
          ),
          buildOptionWidget(
            'Vegetarian-free',
            'Only include veegtarian-free meals',
            vegetarianFree,
            (newValue) {
              setState(() {
                vegetarianFree = newValue;
              });
            },
          ),
          buildOptionWidget(
            'Vegan-free',
            'Only include vegan-free meals',
            vegan,
            (newValue) {
              setState(() {
                vegan = newValue;
              });
            },
          ),
        ],
      ),
    );
  }
}
