import 'package:flutter/material.dart';
import '../screens/orders_screen.dart';
import '../screens/admin_screen.dart';

class AppDrawer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(children: [
        AppBar(
          title: Text("Hello Friend"),
          automaticallyImplyLeading: false,
        ),
        Divider(),
        ListTile(
            leading: Icon(Icons.shop),
            title: Text('Shop'),
            onTap: () {
              Navigator.of(context).pushReplacementNamed('/');
            }),
        Divider(),
        ListTile(
            leading: Icon(Icons.payment),
            title: Text('My Orders'),
            onTap: () {
              Navigator.of(context).pushReplacementNamed(OrderScreen.routeName);
            }),
        Divider(),
        ListTile(
            leading: Icon(Icons.admin_panel_settings),
            title: Text('Admin'),
            onTap: () {
              Navigator.of(context).pushReplacementNamed(AdminScreen.routeName);
            }),
      ]),
    );
  }
}
