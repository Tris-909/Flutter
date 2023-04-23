import 'package:flutter/material.dart';
import '../widgets/productList.dart';

enum FilterOptions {
  Favorites,
  All,
}

class ProductOverviewScreen extends StatefulWidget {
  @override
  createState() => ProductOverviewScreenState();
}

class ProductOverviewScreenState extends State {
  bool isShowingFavorites = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('MyShop'),
        actions: [
          PopupMenuButton(
            onSelected: (FilterOptions selectedValue) {
              if (selectedValue == FilterOptions.All) {
                setState(() {
                  isShowingFavorites = false;
                });
              } else {
                setState(() {
                  isShowingFavorites = true;
                });
              }
            },
            icon: Icon(
              Icons.more_vert,
            ),
            itemBuilder: (_) => [
              PopupMenuItem(
                child: Text('Only Favorites'),
                value: FilterOptions.Favorites,
              ),
              PopupMenuItem(
                child: Text('Show All'),
                value: FilterOptions.All,
              ),
            ],
          ),
        ],
      ),
      body: ProductGrid(isShowingFavorites),
    );
  }
}
