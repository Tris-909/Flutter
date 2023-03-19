import 'package:flutter/material.dart';
import './list.dart';
import '../models/transaction.dart';

class TransactionWidget extends StatelessWidget {
  List<Transaction> transactions;

  TransactionWidget({this.transactions});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        TransactionList(transactions: transactions),
      ],
    );
  }
}
