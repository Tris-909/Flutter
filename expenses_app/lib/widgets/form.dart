import 'package:flutter/material.dart';

class TransactionForm extends StatelessWidget {
  final textController = TextEditingController();
  final amountController = TextEditingController();

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
            ),
            ElevatedButton(
              onPressed: () =>
                  {print("${textController.text} ${amountController.text}")},
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
