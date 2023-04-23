import 'package:flutter/material.dart';
import '../models/cart.dart';

class Cart extends ChangeNotifier {
  Map<String, CartItem> cartItems = {};

  Map<String, CartItem> get getCartItems {
    return {...cartItems};
  }

  int get itemCount {
    return cartItems.length;
  }

  double get totalAmout {
    double total = 0;
    cartItems.forEach((key, cartItem) {
      total += cartItem.price * cartItem.quantity;
    });
    return total;
  }

  void removeCartItem(String id) {
    cartItems.removeWhere((key, value) => key == id);
    notifyListeners();
  }

  void addCartItem(CartItem newCartItem) {
    if (cartItems.containsKey(newCartItem.id)) {
      cartItems.update(
          newCartItem.id,
          (existingCartItem) => CartItem(
                id: existingCartItem.id,
                title: existingCartItem.title,
                quantity: existingCartItem.quantity + 1,
                price: existingCartItem.price,
              ));
    } else {
      cartItems.putIfAbsent(
        newCartItem.id,
        () => CartItem(
          id: DateTime.now().toString(),
          title: newCartItem.title,
          price: newCartItem.price,
          quantity: 1,
        ),
      );
    }
    notifyListeners();
  }
}
