import 'package:flutter/material.dart';
import '../providers/cart.provider.dart';
import 'package:provider/provider.dart';

class CartScreen extends StatelessWidget {
  static const routeName = '/mycart';

  @override
  build(BuildContext context) {
    final cart = Provider.of<Cart>(context, listen: false);

    return Scaffold(
      appBar: AppBar(
        title: Text('My Cart'),
      ),
      body: Column(children: [
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
                      onPressed: null,
                    )
                  ],
                )))
      ]),
    );
  }
}
