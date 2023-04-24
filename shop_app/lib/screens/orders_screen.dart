import 'package:flutter/material.dart';
import '../providers/order.provider.dart';
import 'package:provider/provider.dart';
import '../widgets/orderItem.dart';
import '../widgets/appDrawer.dart';

class OrderScreen extends StatelessWidget {
  static final routeName = '/checkout';

  @override
  Widget build(BuildContext context) {
    final orders = Provider.of<Orders>(context);

    return Scaffold(
        appBar: AppBar(title: Text("Check Out")),
        drawer: AppDrawer(),
        body: ListView.builder(
          itemCount: orders.getOrders.length,
          itemBuilder: (context, index) =>
              OrderItemWidget(order: orders.getOrders[index]),
        ));
  }
}
