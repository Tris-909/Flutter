import 'package:flutter/material.dart';
import '../dummy_data.dart';
import '../widgets/meal_item.dart';
import '../models/meal.dart';

class CategoryMealScreen extends StatefulWidget {
  static const routeName = '/categories-meals';
  List<Meal> filteredMeals;

  CategoryMealScreen(this.filteredMeals);

  @override
  CategoryMealScreenState createState() => CategoryMealScreenState();
}

class CategoryMealScreenState extends State<CategoryMealScreen> {
  String title;
  List<Meal> meals;

  @override
  void initState() {
    meals = widget.filteredMeals;
    super.initState();
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();

    final routeArgs =
        ModalRoute.of(context).settings.arguments as Map<String, String>;
    title = routeArgs['title'];
    final categoryId = routeArgs['id'];
    meals =
        meals.where((meal) => meal.categories.contains(categoryId)).toList();
  }

  removeItem(mealId) {
    setState(() {
      meals.removeWhere((meal) => meal.id == mealId);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(title),
      ),
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
            removeItem: removeItem,
          );
        },
        itemCount: meals.length,
      )),
    );
  }
}
