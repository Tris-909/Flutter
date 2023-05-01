import 'package:flutter/material.dart';

class CartItem {
  final String id;
  final String title;
  int quantity;
  double price;

  Map<String, dynamic> toJson() {
    return {
      "id": this.id,
      "title": this.title,
      "quantity": this.quantity,
      "price": this.price
    };
  }

  @override
  CartItem({this.id, this.title, this.quantity, this.price});
}
