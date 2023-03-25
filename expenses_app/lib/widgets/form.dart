import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class TransactionForm extends StatefulWidget {
  final Function handler;

  TransactionForm(this.handler);

  @override
  TransactionFormState createState() => TransactionFormState();
}

class TransactionFormState extends State<TransactionForm> {
  final textController = TextEditingController();
  final amountController = TextEditingController();
  DateTime choosenDate;

  submitTransaction() {
    var textValue = textController.text;
    var amountValue = double.parse(amountController.text);

    if (textValue.isEmpty || amountValue <= 0) {
      return "";
    }

    widget.handler(
        textController.text, double.parse(amountController.text), choosenDate);
    Navigator.of(context).pop();
  }

  presentDatePicker() {
    showDatePicker(
            context: context,
            initialDate: DateTime.now(),
            firstDate: DateTime(1900),
            lastDate: DateTime.now())
        .then((pickedDate) {
      if (pickedDate == null) {
        return;
      } else {
        setState(() {
          choosenDate = pickedDate;
        });
      }
    });
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
            Container(
              height: 70,
              child: Row(
                children: [
                  Expanded(
                      child: Text(choosenDate == null
                          ? "No Date Choosen"
                          : DateFormat.yMd().format(choosenDate))),
                  ElevatedButton(
                      onPressed: presentDatePicker, child: Text('choose Date'))
                ],
              ),
            ),
            ElevatedButton(
              onPressed: submitTransaction,
              style: ButtonStyle(
                backgroundColor: MaterialStateProperty.all<Color>(Colors.red),
              ),
              child: const Text(
                "Submit",
                style: TextStyle(color: Colors.white),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
