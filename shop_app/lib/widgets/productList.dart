import 'package:flutter/material.dart';
import '../widgets/productItem.dart';
import 'package:provider/provider.dart';
import '../providers/products.provider.dart';

class ProductGrid extends StatelessWidget {
  bool isShowingFavorites;

  ProductGrid(this.isShowingFavorites);

  @override
  Widget build(BuildContext context) {
    final productData = Provider.of<Products>(context);
    final products =
        isShowingFavorites ? productData.getFavorItems : productData.items;

    return GridView.builder(
      padding: const EdgeInsets.all(10),
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        childAspectRatio: 3 / 2,
        crossAxisSpacing: 10,
        mainAxisSpacing: 10,
      ),
      itemBuilder: (ctx, i) => ChangeNotifierProvider.value(
        value: products[i],
        child: ProductItem(),
      ),
      itemCount: products.length,
    );
  }
}
