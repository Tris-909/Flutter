import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import '../models/transaction.dart';

class TransactionList extends StatelessWidget {
  List<Transaction> transactions;

  TransactionList({@required this.transactions});

  @override
  Widget build(BuildContext context) {
    return Container(
        height: 600,
        child: ListView(
          children: [
            ...transactions.map(
              (transaction) => Card(
                child: Row(
                  children: [
                    Container(
                      margin: const EdgeInsets.symmetric(
                          vertical: 10, horizontal: 15),
                      decoration: BoxDecoration(
                          border: Border.all(
                              width: 2, color: Theme.of(context).primaryColor)),
                      padding: const EdgeInsets.all(5),
                      child: Text(
                        "${transaction.amount.toStringAsFixed(2)} \$",
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 20,
                          color: Theme.of(context).primaryColor,
                        ),
                      ),
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          transaction.title,
                          style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                              color: Theme.of(context).primaryColor),
                        ),
                        Text(
                          DateFormat.yMd().add_jm().format(transaction.date),
                          style: const TextStyle(color: Colors.grey),
                        )
                      ],
                    ),
                  ],
                ),
              ),
            )
          ],
        ));
  }
}
