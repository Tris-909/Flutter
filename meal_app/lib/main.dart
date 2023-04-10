import 'package:flutter/material.dart';
import 'screens/categories_screen.dart';
import 'screens/category_meal_screen.dart';
import 'screens/meal_detail_screen.dart';
import 'screens/tab_screen.dart';
import 'screens/filtered_screen.dart';
import './dummy_data.dart';
import './models/meal.dart';

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  @override
  MyAppState createState() => MyAppState();
}

class MyAppState extends State<MyApp> {
  Map<String, bool> filters = {
    'glutenFree': false,
    'vegetarianFree': false,
    'vegan': false,
    'lactoseFree': false
  };
  List<Meal> available_meals = DUMMY_MEALS;

  void updateFilters(Map<String, bool> values) {
    setState(() {
      filters = values;
      available_meals = DUMMY_MEALS.where((meal) {
        if (filters["glutenFree"] && !meal.isGlutenFree) {
          return false;
        }
        if (filters["vegetarianFree"] && !meal.isVegetarian) {
          return false;
        }
        if (filters["vegan"] && !meal.isVegan) {
          return false;
        }
        if (filters["lactoseFree"] && !meal.isLactoseFree) {
          return false;
        }
        return true;
      }).toList();
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'DeliMeals',
      theme: ThemeData(
        canvasColor: Color.fromRGBO(255, 254, 229, 1),
        fontFamily: 'Raleway',
        textTheme: ThemeData.light().textTheme.copyWith(
              bodyLarge: TextStyle(color: Color.fromRGBO(20, 51, 51, 1)),
              bodyMedium: TextStyle(color: Color.fromRGBO(20, 51, 51, 1)),
              titleLarge: TextStyle(
                fontSize: 20,
                fontFamily: 'RobotoCondensed',
                fontWeight: FontWeight.bold,
              ),
            ),
        colorScheme: ColorScheme.fromSwatch(primarySwatch: Colors.pink)
            .copyWith(secondary: Colors.amber),
      ),
      initialRoute: '/',
      routes: {
        '/': (ctx) => TabsScreen(),
        CategoryMealScreen.routeName: (ctx) =>
            CategoryMealScreen(available_meals),
        MealDetailScreen.routeName: (ctx) => MealDetailScreen(),
        FilteredScreen.routeName: (ctx) =>
            FilteredScreen(updateFilters, filters),
      },
      onUnknownRoute: (settings) {
        return MaterialPageRoute(builder: (ctx) => CatergoriesScreen());
      },
    );
  }
}
