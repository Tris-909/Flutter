import 'package:flutter/material.dart';
import '../providers/cart.provider.dart';
import '../providers/order.provider.dart';
import 'package:provider/provider.dart';
import '../widgets/cartItem.dart';
import './orders_screen.dart';

class CartScreen extends StatelessWidget {
  static const routeName = '/mycart';

  @override
  build(BuildContext context) {
    final cart = Provider.of<Cart>(context);
    final order = Provider.of<Orders>(context, listen: false);
    final scaffoldMessenger = ScaffoldMessenger.of(context);

    return Scaffold(
      appBar: AppBar(
        title: Text('My Cart'),
      ),
      body: Column(
        children: [
          Card(
            margin: EdgeInsets.all(15),
            child: Padding(
              padding: EdgeInsets.all(8),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      Text('Total', style: TextStyle(fontSize: 20)),
                      SizedBox(
                        width: 10,
                      ),
                      Chip(
                        label: Text(
                          '${cart.totalAmout.toStringAsFixed(2).toString()} \$',
                          style: TextStyle(color: Colors.white),
                        ),
                        backgroundColor: Colors.purple,
                      ),
                    ],
                  ),
                  ElevatedButton(
                      child: Text(
                        'Order Now',
                        style: TextStyle(color: Colors.white),
                      ),
                      style: ButtonStyle(
                        backgroundColor:
                            MaterialStateProperty.all<Color>(Colors.purple),
                      ),
                      onPressed: () async {
                        try {
                          await order.addOrders(
                              cart.getCartItems.values.toList(),
                              cart.totalAmout);
                          Navigator.of(context)
                              .pushNamed(OrderScreen.routeName);
                          cart.clear();
                        } catch (error) {
                          scaffoldMessenger.showSnackBar(SnackBar(
                            content: Text('Check out failed, please try again'),
                          ));
                        }
                      }),
                ],
              ),
            ),
          ),
          SizedBox(
            height: 10,
          ),
          Expanded(
              child: ListView.builder(
            itemCount: cart.itemCount,
            itemBuilder: (ctx, i) => CartItem(
              id: cart.getCartItems.values.toList()[i].id,
              productId: cart.getCartItems.keys.toList()[i],
              title: cart.getCartItems.values.toList()[i].title,
              price: cart.getCartItems.values.toList()[i].price,
              quantity: cart.getCartItems.values.toList()[i].quantity,
            ),
          ))
        ],
      ),
    );
  }
}
