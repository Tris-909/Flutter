import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import '../models/transaction.dart';

class TransactionList extends StatelessWidget {
  List<Transaction> transactions = [];

  TransactionList({@required transactions});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ...transactions.map(
          (transaction) => Card(
            child: Row(
              children: [
                Container(
                  margin:
                      const EdgeInsets.symmetric(vertical: 10, horizontal: 15),
                  decoration: BoxDecoration(
                      border: Border.all(width: 2, color: Colors.purple)),
                  padding: const EdgeInsets.all(5),
                  child: Text(
                    "${transaction.amount.toString()} \$",
                    style: const TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 20,
                      color: Colors.purple,
                    ),
                  ),
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      transaction.title,
                      style: const TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          color: Colors.purple),
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
    );
  }
}
