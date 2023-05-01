import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../widgets/productList.dart';
import '../widgets/showNumberCart.dart';
import '../providers/products.provider.dart';
import '../providers/cart.provider.dart';
import './cart_screen.dart';
import '../widgets/appDrawer.dart';

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
  bool isLoading = false;

  @override
  void initState() {
    setState(() {
      isLoading = true;
    });

    Provider.of<Products>(context, listen: false).getProducts().then(
      (_) {
        setState(() {
          isLoading = false;
        });
      },
    );

    super.initState();
  }

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
          Consumer<Cart>(
            builder: (_, cart, child) => ShowNumberCart(
              child: child,
              value: cart.itemCount.toString(),
            ),
            child: IconButton(
              onPressed: () {
                Navigator.of(context).pushNamed(CartScreen.routeName);
              },
              icon: Icon(Icons.shopping_cart),
            ),
          ),
        ],
      ),
      drawer: AppDrawer(),
      body: isLoading
          ? Center(
              child: CircularProgressIndicator(),
            )
          : ProductGrid(isShowingFavorites),
    );
  }
}
