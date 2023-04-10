import 'package:flutter/material.dart';

class FilteredScreen extends StatefulWidget {
  static String routeName = "/filtered_meals";
  final Function saveFilters;
  final Map<String, bool> saveFiltersValues;

  FilteredScreen(this.saveFilters, this.saveFiltersValues);

  @override
  FilteredScreenState createState() => FilteredScreenState();
}

class FilteredScreenState<T> extends State<FilteredScreen> {
  Map<String, bool> filters = {
    'glutenFree': false,
    'vegetarianFree': false,
    'vegan': false,
    'lactoseFree': false
  };

  @override
  void initState() {
    setState(() {
      filters = widget.saveFiltersValues;
    });
    super.initState();
  }

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
      ),
    );
  }

  void onSaveFilters() {
    widget.saveFilters(filters);
    Navigator.of(context).pushReplacementNamed('/');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Filtered Meals'),
        actions: [
          IconButton(
            onPressed: onSaveFilters,
            icon: Icon(Icons.save),
          )
        ],
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
            filters['glutenFree'],
            (newValue) {
              setState(() {
                filters['glutenFree'] = newValue;
              });
            },
          ),
          buildOptionWidget(
            'Lactose-free',
            'Only include lactose-free meals',
            filters['lactoseFree'],
            (newValue) {
              setState(() {
                filters['lactoseFree'] = newValue;
              });
            },
          ),
          buildOptionWidget(
            'Vegetarian-free',
            'Only include veegtarian-free meals',
            filters['vegetarianFree'],
            (newValue) {
              setState(() {
                filters['vegetarianFree'] = newValue;
              });
            },
          ),
          buildOptionWidget(
            'Vegan-free',
            'Only include vegan-free meals',
            filters['vegan'],
            (newValue) {
              setState(() {
                filters['vegan'] = newValue;
              });
            },
          ),
        ],
      ),
    );
  }
}
