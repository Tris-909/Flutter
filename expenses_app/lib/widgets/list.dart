import 'package:flutter/material.dart';
import '../models/transaction.dart';
import './listItem.dart';

class TransactionList extends StatelessWidget {
  List<Transaction> transactions;
  Function deleteTransaction;

  TransactionList({@required this.transactions, this.deleteTransaction});

  @override
  Widget build(BuildContext context) {
    return transactions.isEmpty
        ? Expanded(child: LayoutBuilder(builder: (context, constraints) {
            return Column(
              children: [
                Expanded(
                  child: Container(
                    height: constraints.maxHeight * 0.6,
                    child: Image.asset(
                      'assets/images/waiting.png',
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                const Text("No Transactions were added yet!"),
              ],
            );
          }))
        : Flexible(
            child: ListView.builder(
            itemBuilder: (ctx, index) => TransactionItem(
                txnItem: transactions[index], deleteHandler: deleteTransaction),
            itemCount: transactions.length,
          ));
  }
}
