import 'package:flutter/material.dart';

class TransactionForm extends StatefulWidget {
  final Function handler;

  TransactionForm(this.handler);

  @override
  TransactionFormState createState() => TransactionFormState();
}

class TransactionFormState extends State<TransactionForm> {
  final textController = TextEditingController();
  final amountController = TextEditingController();

  submitTransaction() {
    var textValue = textController.text;
    var amountValue = double.parse(amountController.text);

    if (textValue.isEmpty || amountValue <= 0) {
      return "";
    }

    widget.handler(textController.text, double.parse(amountController.text));
    Navigator.of(context).pop();
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Container(
        padding: const EdgeInsets.all(10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            TextField(
              decoration: InputDecoration(labelText: "Title :"),
              controller: textController,
            ),
            TextField(
              decoration: InputDecoration(labelText: "Amount :"),
              controller: amountController,
              keyboardType: TextInputType.number,
            ),
            ElevatedButton(
              onPressed: submitTransaction,
              style: ButtonStyle(
                backgroundColor: MaterialStateProperty.all<Color>(Colors.white),
              ),
              child: const Text(
                "Submit",
                style: TextStyle(color: Colors.purple),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
