import 'package:flutter/material.dart';
import '../models/order.dart';
import 'package:intl/intl.dart';
import 'dart:math';

class OrderItemWidget extends StatefulWidget {
  const OrderItemWidget({this.order});

  final OrderItem order;

  @override
  OrderItemWidgetState createState() => OrderItemWidgetState();
}

class OrderItemWidgetState extends State<OrderItemWidget> {
  bool isExpanding = false;

  @override
  Widget build(BuildContext context) {
    return Card(
        margin: EdgeInsets.all(10),
        child: Column(
          children: [
            ListTile(
              title: Text('${widget.order.amount} \$'),
              subtitle: Text(DateFormat('dd MM yyyy hh:mm')
                  .format(widget.order.createdAt)),
              trailing: IconButton(
                icon: Icon(isExpanding ? Icons.expand_more : Icons.expand_less),
                onPressed: () {
                  setState(() {
                    isExpanding = !isExpanding;
                  });
                },
              ),
            ),
            if (isExpanding)
              Container(
                  padding: EdgeInsets.symmetric(horizontal: 15, vertical: 4),
                  height: min(widget.order.products.length * 20.0 + 100.0, 100),
                  child: ListView(
                    children: widget.order.products
                        .map((product) => Row(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: [
                                Text(product.title),
                                Text('${product.quantity}x \$${product.price}')
                              ],
                            ))
                        .toList(),
                  )),
          ],
        ));
  }
}
