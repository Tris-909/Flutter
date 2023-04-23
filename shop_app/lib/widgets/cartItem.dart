import 'package:flutter/material.dart';

class CartItem extends StatelessWidget {
  final String id;
  final String title;
  final int quantity;
  final double price;

  @override
  CartItem({this.id, this.title, this.quantity, this.price});

  @override
  build(BuildContext context) {
    return Card(
        margin: EdgeInsets.symmetric(horizontal: 15, vertical: 5),
        child: Padding(
          padding: EdgeInsets.all(8),
          child: ListTile(
            leading: CircleAvatar(
              child: Padding(
                padding: EdgeInsets.all(5),
                child: FittedBox(
                  child: Text(
                    '${price} \$',
                  ),
                ),
              ),
              radius: 30,
            ),
            title: Text(title),
            subtitle:
                Text('Total: ${(price * quantity).toStringAsFixed(2)} \$'),
            trailing: Text('$quantity x'),
          ),
        ));
  }
}
