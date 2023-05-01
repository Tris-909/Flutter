import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

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

  Future<void> toggleFavouriteStatus(String productId) async {
    final url = Uri.parse(
        'https://flutter-shop-app-23df4-default-rtdb.firebaseio.com/products/${productId}.json');
    final statusBeforeOperation = isFavored;

    try {
      isFavored = !statusBeforeOperation;
      notifyListeners();

      final response = await http.patch(url,
          body: json.encode({'isFavorite': !statusBeforeOperation}));

      print(json.decode(response.body));
    } catch (error) {
      print(error);

      isFavored = statusBeforeOperation;
      notifyListeners();

      throw Exception('Failed to favor the product, please try again');
    }
  }
}
