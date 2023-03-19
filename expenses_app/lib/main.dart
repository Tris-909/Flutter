import 'package:flutter/material.dart';
import './models/transaction.dart';
import './widgets/transactionWidget.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(title: "Flutter App", home: MyHomePage());
  }
}

class MyHomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Flutter App"), actions: <Widget>[
        IconButton(onPressed: () => {}, icon: Icon(Icons.add))
      ]),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Container(
            width: double.infinity,
            color: Colors.blue,
            child: Card(
              color: Colors.blue,
              child: Container(child: Text("Chart")),
            ),
          ),
          TransactionWidget()
        ],
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: () => {},
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    );
  }
}
