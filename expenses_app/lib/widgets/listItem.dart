import 'package:flutter/material.dart';
import '../models/transaction.dart';
import 'package:intl/intl.dart';

class TransactionItem extends StatelessWidget {
  Transaction txnItem;
  Function deleteHandler;

  TransactionItem({this.txnItem, this.deleteHandler});

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 5,
      margin: const EdgeInsets.symmetric(vertical: 8, horizontal: 5),
      child: ListTile(
        leading: CircleAvatar(
          radius: 30,
          child: Padding(
            padding: const EdgeInsets.all(5),
            child: FittedBox(
              child: Text(
                " \$${txnItem.amount.toStringAsFixed(2)}",
              ),
            ),
          ),
        ),
        title: Text(
          txnItem.title,
          style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
              color: Theme.of(context).primaryColor),
        ),
        subtitle: Text(
          DateFormat.yMd().add_jm().format(txnItem.date),
          style: const TextStyle(color: Colors.grey),
        ),
        trailing: MediaQuery.of(context).size.width > 500
            ? TextButton.icon(
                icon: const Icon(Icons.delete),
                label: const Text(
                  "Delete",
                  style: TextStyle(color: Colors.red),
                ),
                onPressed: () => deleteHandler(txnItem.id),
              )
            : IconButton(
                icon: const Icon(Icons.delete),
                onPressed: () {
                  deleteHandler(txnItem.id);
                },
              ),
      ),
    );
  }
}
