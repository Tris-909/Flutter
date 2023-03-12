import 'package:flutter/material.dart';
import './form.dart';
import './list.dart';
import '../models/transaction.dart';

class TransactionWidget extends StatefulWidget {
  @override
  State createState() => TransactionState();
}

class TransactionState extends State {
  List<Transaction> transactions = [
    Transaction(id: "1", title: 'Title 1', amount: 10.00, date: DateTime.now()),
    Transaction(id: "2", title: 'Title 2', amount: 15.00, date: DateTime.now()),
    Transaction(id: "3", title: 'Title 3', amount: 20.00, date: DateTime.now()),
  ];

  void addNewTransaction(String title, double amount) {
    final newTransaction = Transaction(
      title: title,
      amount: amount,
      date: DateTime.now(),
      id: DateTime.now().toString(),
    );

    setState(() {
      transactions.add(newTransaction);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        TransactionForm(handler: addNewTransaction),
        TransactionList(transactions: transactions),
      ],
    );
  }
}
