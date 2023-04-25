import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../providers/products.provider.dart';
import '../widgets/adminItem.dart';
import '../widgets/appDrawer.dart';
import './edit_screen.dart';

class AdminScreen extends StatelessWidget {
  static final routeName = '/admin';

  @override
  Widget build(BuildContext context) {
    final products = Provider.of<Products>(context);

    return Scaffold(
      appBar: AppBar(title: Text("Admin Page"), actions: [
        IconButton(
            onPressed: () {
              Navigator.of(context).pushNamed(EditScreen.routeName);
            },
            icon: Icon(Icons.add)),
      ]),
      drawer: AppDrawer(),
      body: Padding(
        padding: EdgeInsets.all(10),
        child: ListView.builder(
          itemBuilder: (ctx, index) => AdminItem(
            title: products.items[index].title,
            imageUrl: products.items[index].imageUrl,
          ),
          itemCount: products.items.length,
        ),
      ),
    );
  }
}
