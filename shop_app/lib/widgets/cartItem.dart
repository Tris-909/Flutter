import 'package:flutter/material.dart';
import '../providers/cart.provider.dart';
import 'package:provider/provider.dart';

class CartItem extends StatelessWidget {
  final String id;
  final String productId;
  final String title;
  final int quantity;
  final double price;

  @override
  CartItem({this.id, this.productId, this.title, this.quantity, this.price});

  @override
  build(BuildContext context) {
    final cart = Provider.of<Cart>(context, listen: false);

    return Dismissible(
        key: ValueKey(id),
        background: Container(
          color: Colors.red,
          child: Icon(Icons.delete, color: Colors.white, size: 40),
          alignment: Alignment.centerRight,
          padding: EdgeInsets.only(right: 20),
        ),
        direction: DismissDirection.endToStart,
        confirmDismiss: (direction) {
          return showDialog(
            context: context,
            builder: (ctx) => AlertDialog(
              title: Text("Confirmation"),
              content: Text("Are you sure you want to delete ${title} ?"),
              actions: [
                TextButton(
                  child: Text('No'),
                  onPressed: () {
                    Navigator.of(context).pop(false);
                  },
                ),
                TextButton(
                  child: Text('Yes'),
                  onPressed: () {
                    Navigator.of(context).pop(true);
                    cart.removeCartItem(productId);
                  },
                ),
              ],
            ),
          );
        },
        child: Card(
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
            )));
  }
}
