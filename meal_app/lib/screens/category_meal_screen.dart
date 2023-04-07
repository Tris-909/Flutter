import 'package:flutter/material.dart';
import '../dummy_data.dart';
import '../widgets/meal_item.dart';

class CategoryMealScreen extends StatelessWidget {
  static const routeName = '/categories-meals';

  @override
  Widget build(BuildContext context) {
    final routeArgs =
        ModalRoute.of(context).settings.arguments as Map<String, String>;
    final categoryTitle = routeArgs['title'];
    final categoryId = routeArgs['id'];
    final filteredMealList = DUMMY_MEALS
        .where((meal) => meal.categories.contains(categoryId))
        .toList();

    return Scaffold(
      appBar: AppBar(
        title: Text(categoryTitle),
      ),
      body: Container(
          child: ListView.builder(
        itemBuilder: (ctx, index) {
          return MealItem(
            title: filteredMealList[index].title,
            imageUrl: filteredMealList[index].imageUrl,
            duration: filteredMealList[index].duration,
            complexity: filteredMealList[index].complexity,
            affordability: filteredMealList[index].affordability,
            id: filteredMealList[index].id,
            ingredients: filteredMealList[index].ingredients,
            steps: filteredMealList[index].steps,
          );
        },
        itemCount: filteredMealList.length,
      )),
    );
  }
}
