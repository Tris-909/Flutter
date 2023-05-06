import 'package:flutter/material.dart';
import '../providers/order.provider.dart';
import 'package:provider/provider.dart';
import '../widgets/orderItem.dart';
import '../widgets/appDrawer.dart';

class OrderScreen extends StatefulWidget {
  static final routeName = '/checkout';

  @override
  OrderScreenState createState() => OrderScreenState();
}

class OrderScreenState extends State<OrderScreen> {
  Future ordersFuture;

  Future obtainOrdersFuture() {
    return Provider.of<Orders>(context, listen: false).updateOrdersList();
  }

  @override
  void initState() {
    ordersFuture = obtainOrdersFuture();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Check Out")),
      drawer: AppDrawer(),
      body: FutureBuilder(
        future: ordersFuture,
        builder: (ctx, dataSnapShot) {
          if (dataSnapShot.connectionState == ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator());
          } else {
            if (dataSnapShot.error != null) {
              return Center(
                child: Text("Something went wrong !"),
              );
            } else {
              return Consumer<Orders>(
                builder: (ctx, orderData, child) => ListView.builder(
                  itemCount: orderData.orders.length,
                  itemBuilder: (context, index) =>
                      OrderItemWidget(order: orderData.orders[index]),
                ),
              );
            }
          }
        },
      ),
    );
  }
}
