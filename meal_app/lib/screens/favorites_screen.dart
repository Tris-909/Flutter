import 'package:flutter/material.dart';
import '../dummy_data.dart';
import '../models/meal.dart';
import '../widgets/meal_item.dart';

class FavoritesScreen extends StatefulWidget {
  static String routeName = '/favourites';
  final List<String> favorIds;

  FavoritesScreen(this.favorIds);

  @override
  FavoritesScreenState createState() => FavoritesScreenState();
}

class FavoritesScreenState extends State<FavoritesScreen> {
  List<Meal> meals = DUMMY_MEALS;

  @override
  void initState() {
    setState(() {
      meals = meals.where((meal) => widget.favorIds.contains(meal.id)).toList();
    });
    super.initState();
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
  }

  @override
  build(BuildContext context) {
    return Scaffold(
      body: Container(
          child: ListView.builder(
        itemBuilder: (ctx, index) {
          return MealItem(
            title: meals[index].title,
            imageUrl: meals[index].imageUrl,
            duration: meals[index].duration,
            complexity: meals[index].complexity,
            affordability: meals[index].affordability,
            id: meals[index].id,
            ingredients: meals[index].ingredients,
            steps: meals[index].steps,
            removeItem: null,
          );
        },
        itemCount: meals.length,
      )),
    );
  }
}
