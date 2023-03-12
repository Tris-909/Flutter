import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import './transaction.dart';

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
  final List<Transaction> transactions = [
    Transaction(id: "1", title: 'Title 1', amount: 10.00, date: DateTime.now()),
    Transaction(id: "2", title: 'Title 2', amount: 15.00, date: DateTime.now()),
    Transaction(id: "3", title: 'Title 3', amount: 20.00, date: DateTime.now()),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Flutter App"),
        ),
        body: Column(
          children: [
            Container(
                child: Card(
                  child: Container(child: Text("Chart")),
                  color: Colors.blue,
                ),
                width: double.infinity,
                color: Colors.blue),
            Column(
              children: [
                ...transactions.map((transaction) => Card(
                        child: Row(children: [
                      Container(
                          child: Text("${transaction.amount.toString()} \$",
                              style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 20,
                                  color: Colors.purple)),
                          margin: EdgeInsets.symmetric(
                              vertical: 10, horizontal: 15),
                          decoration: BoxDecoration(
                              border:
                                  Border.all(width: 2, color: Colors.purple)),
                          padding: EdgeInsets.all(5)),
                      Column(
                        children: [
                          Text(
                            transaction.title,
                            style: TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                                color: Colors.purple),
                          ),
                          Text(
                            DateFormat.yMd().add_jm().format(transaction.date),
                            style: TextStyle(color: Colors.grey),
                          )
                        ],
                        crossAxisAlignment: CrossAxisAlignment.start,
                      ),
                    ])))
              ],
            )
          ],
          mainAxisAlignment: MainAxisAlignment.center,
        ));
  }
}
