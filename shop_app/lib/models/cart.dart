import 'package:flutter/material.dart';

class CartItem {
  final String id;
  final String title;
  int quantity;
  double price;

  @override
  CartItem({this.id, this.title, this.quantity, this.price});
}
