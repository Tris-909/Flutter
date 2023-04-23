import 'package:flutter/material.dart';

class Product with ChangeNotifier {
  @required
  final String id;
  @required
  final String title;
  @required
  final String description;
  final double price;
  @required
  final String imageUrl;
  bool isFavored;

  @override
  Product({
    this.id,
    this.title,
    this.description,
    this.price,
    this.imageUrl,
    this.isFavored = false,
  });

  void toggleFavouriteStatus() {
    isFavored = !isFavored;
    notifyListeners();
  }
}
