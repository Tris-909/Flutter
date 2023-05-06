import 'package:flutter/material.dart';
import '../providers/order.provider.dart';
import 'package:provider/provider.dart';
import '../widgets/orderItem.dart';
import '../widgets/appDrawer.dart';

class OrderScreen extends StatefulWidget {
  static final routeName = '/checkout';

  @override
  createState() => OrderScreenState();
}

class OrderScreenState extends State {
  bool isLoading = false;

  @override
  void initState() {
    setState(() {
      isLoading = true;
    });
    Provider.of<Orders>(context, listen: false).updateOrdersList();
    setState(() {
      isLoading = false;
    });
    super.initState();
  }

  Future<void> refreshListOfOrders() async {
    setState(() {
      isLoading = true;
    });

    await Provider.of<Orders>(context, listen: false).updateOrdersList();

    setState(() {
      isLoading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    final orders = Provider.of<Orders>(context);

    return Scaffold(
      appBar: AppBar(title: Text("Check Out")),
      drawer: AppDrawer(),
      body: isLoading
          ? Center(child: CircularProgressIndicator())
          : RefreshIndicator(
              child: ListView.builder(
                itemCount: orders.getOrders.length,
                itemBuilder: (context, index) =>
                    OrderItemWidget(order: orders.getOrders[index]),
              ),
              onRefresh: refreshListOfOrders),
    );
  }
}
