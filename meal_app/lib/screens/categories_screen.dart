import 'package:flutter/material.dart';
import '../dummy_data.dart';
import '../widgets/cateogory_item.dart';

class CatergoriesScreen extends StatelessWidget {
  @override
  Widget build(BuildContext ctx) {
    return GridView(
      padding: const EdgeInsets.all(25),
      children: DUMMY_CATEGORIES
          .map((category) => CategoryItem(
                id: category.id,
                title: category.title,
                color: category.color,
              ))
          .toList(),
      gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
        maxCrossAxisExtent: 200,
        childAspectRatio: 3 / 2,
        crossAxisSpacing: 20,
        mainAxisSpacing: 20,
      ),
    );
  }
}
