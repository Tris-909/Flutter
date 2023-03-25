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
                      ),
                    ),
                  ),
                ],
              ));
  }
}

// ListView(
//               children: [
//                 ...transactions.map(
//                   (transaction) => Card(
//                     child: Row(
//                       children: [
//                         Container(
//                           margin: const EdgeInsets.symmetric(
//                               vertical: 10, horizontal: 15),
//                           decoration: BoxDecoration(
//                               border: Border.all(
//                                   width: 2,
//                                   color: Theme.of(context).primaryColor)),
//                           padding: const EdgeInsets.all(5),
//                           child: Text(
//                             "${transaction.amount.toStringAsFixed(2)} \$",
//                             style: TextStyle(
//                               fontWeight: FontWeight.bold,
//                               fontSize: 20,
//                               color: Theme.of(context).primaryColor,
//                             ),
//                           ),
//                         ),
//                         Column(
//                           crossAxisAlignment: CrossAxisAlignment.start,
//                           children: [
//                             Text(
//                               transaction.title,
//                               style: TextStyle(
//                                   fontSize: 20,
//                                   fontWeight: FontWeight.bold,
//                                   color: Theme.of(context).primaryColor),
//                             ),
//                             Text(
//                               DateFormat.yMd()
//                                   .add_jm()
//                                   .format(transaction.date),
//                               style: const TextStyle(color: Colors.grey),
//                             )
//                           ],
//                         ),
//                       ],
//                     ),
//                   ),
//                 )
//               ],
//             ),