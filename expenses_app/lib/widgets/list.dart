import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import '../models/transaction.dart';

class TransactionList extends StatelessWidget {
  List<Transaction> transactions;
  Function deleteTransaction;

  TransactionList({@required this.transactions, this.deleteTransaction});

  @override
  Widget build(BuildContext context) {
    return Container(
        height: 600,
        child: transactions.isEmpty
            ? Column(
                children: [
                  Container(
                    height: 200,
                    child: Image.asset(
                      'assets/images/waiting.png',
                      fit: BoxFit.cover,
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Text("No Transactions were added yet!"),
                ],
              )
            : ListView(
                children: [
                  ...transactions.map(
                    (transaction) => Card(
                      elevation: 5,
                      margin: EdgeInsets.symmetric(vertical: 8, horizontal: 5),
                      child: ListTile(
                          leading: CircleAvatar(
                            radius: 30,
                            child: Padding(
                              padding: EdgeInsets.all(5),
                              child: FittedBox(
                                child: Text(
                                  " \$${transaction.amount.toStringAsFixed(2)}",
                                ),
                              ),
                            ),
                          ),
                          title: Text(
                            transaction.title,
                            style: TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                                color: Theme.of(context).primaryColor),
                          ),
                          subtitle: Text(
                            DateFormat.yMd().add_jm().format(transaction.date),
                            style: const TextStyle(color: Colors.grey),
                          ),
                          trailing: IconButton(
                            icon: Icon(Icons.delete),
                            onPressed: () {
                              deleteTransaction(transaction.id);
                            },
                          )),
                    ),
                  ),
                ],
              ));
  }
}
