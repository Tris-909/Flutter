import 'package:flutter/material.dart';
import '../models/order.dart';
import '../models/cart.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class Orders extends CartItem with ChangeNotifier {
  List<OrderItem> orders = [];

  List<OrderItem> get getOrders {
    return [...orders];
  }

  Future<void> addOrders(List<CartItem> cartProducts, double total) async {
    final url = Uri.parse(
        'https://flutter-shop-app-23df4-default-rtdb.firebaseio.com/orders.json');

    try {
      final response = await http.post(url,
          body: json.encode({
            'amount': total,
            'createdAt': DateTime.now().toString(),
            'products':
                (cartProducts.map((i) => i.toJson()).toList()).toString(),
          }));

      orders.insert(
          0,
          OrderItem(
              id: json.decode(response.body)['name'],
              amount: total,
              createdAt: DateTime.now(),
              products: cartProducts));
      notifyListeners();
    } catch (error) {
      print(error);
      throw Exception('Saving Order operation failed');
    }
  }

  void clear() {
    orders = [];
    notifyListeners();
  }
}
