import 'package:flutter/material.dart';
import './models/transaction.dart';
import './widgets/transactionWidget.dart';
import './widgets/form.dart';
import './widgets/chart.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Personal Expenses",
      theme: ThemeData(
          primarySwatch: Colors.red,
          accentColor: Colors.amber,
          fontFamily: 'OpenSans',
          textTheme: ThemeData.light()
              .textTheme
              .copyWith(titleLarge: TextStyle(fontFamily: 'OpenSans'))),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  MyHomePageState createState() => MyHomePageState();
}

class MyHomePageState extends State<MyHomePage> {
  List<Transaction> transactions = [
    // Transaction(id: "1", title: "title1", amount: 10.55, date: DateTime.now()),
    // Transaction(id: "2", title: "title2", amount: 12.55, date: DateTime.now()),
    // Transaction(id: "3", title: "title3", amount: 13.55, date: DateTime.now()),
    // Transaction(id: "4", title: "title4", amount: 14.55, date: DateTime.now()),
    // Transaction(id: "5", title: "title5", amount: 15.55, date: DateTime.now()),
    // Transaction(id: "6", title: "title6", amount: 16.55, date: DateTime.now()),
    // Transaction(id: "7", title: "title7", amount: 17.55, date: DateTime.now()),
  ];
  bool showChart = false;

  List<Transaction> get recentTransactions {
    return transactions.where((tx) {
      return tx.date.isAfter(DateTime.now().subtract(Duration(days: 7)));
    }).toList();
  }

  void addNewTransaction(String title, double amount, DateTime date) {
    final newTransaction = Transaction(
      title: title,
      amount: amount,
      date: date,
      id: date.toString(),
    );

    setState(() {
      transactions.add(newTransaction);
    });
  }

  void removeTransaction(String id) {
    final newTransactionList = transactions.removeWhere((txn) => txn.id == id);

    setState(() {
      transactions:
      newTransactionList;
    });
  }

  void startNewTransaction(BuildContext ctx) {
    showModalBottomSheet(
        context: ctx,
        builder: (_) {
          return GestureDetector(
            onTap: () {},
            behavior: HitTestBehavior.opaque,
            child: TransactionForm(addNewTransaction),
          );
        });
  }

  @override
  Widget build(BuildContext context) {
    final isLandscape =
        MediaQuery.of(context).orientation == Orientation.landscape;
    final appBar = AppBar(
      title: Text("Personal Expenses"),
      actions: <Widget>[
        IconButton(
            onPressed: () => startNewTransaction(context),
            icon: Icon(Icons.add))
      ],
    );
    final txListWidget = Container(
      height: (MediaQuery.of(context).size.height -
              appBar.preferredSize.height -
              MediaQuery.of(context).padding.top) *
          0.7,
      child: TransactionWidget(
          transactions: transactions, deleteTransaction: removeTransaction),
    );

    return Scaffold(
      appBar: appBar,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          if (isLandscape)
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text("show chart"),
                Switch(
                    value: showChart,
                    onChanged: (value) {
                      setState(() {
                        showChart = value;
                      });
                    })
              ],
            ),
          if (!isLandscape)
            Container(
              height: (MediaQuery.of(context).size.height -
                      appBar.preferredSize.height -
                      MediaQuery.of(context).padding.top) *
                  0.3,
              child: Chart(recentTransactions),
            ),
          if (!isLandscape) txListWidget,
          if (isLandscape)
            showChart
                ? Container(
                    height: (MediaQuery.of(context).size.height -
                            appBar.preferredSize.height -
                            MediaQuery.of(context).padding.top) *
                        0.7,
                    child: Chart(recentTransactions),
                  )
                : txListWidget,
        ],
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: () => startNewTransaction(context),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    );
  }
}
