import 'package:flutter/material.dart';
import '../models/order.dart';
import '../models/cart.dart';

class Orders with ChangeNotifier {
  List<OrderItem> orders = [];

  List<OrderItem> get getOrders {
    return [...orders];
  }

  void addOrders(List<CartItem> cartProducts, double total) {
    orders.insert(
        0,
        OrderItem(
            id: DateTime.now().toString(),
            amount: total,
            createdAt: DateTime.now(),
            products: cartProducts));
    notifyListeners();
  }

  void clear() {
    orders = [];
    notifyListeners();
  }
}
