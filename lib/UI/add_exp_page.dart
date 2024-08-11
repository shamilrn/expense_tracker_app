import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../features/expense.dart';
import 'exp_provider.dart';

class AddExpPage extends StatelessWidget {

  final TextEditingController title_Controller = TextEditingController();
  final TextEditingController amount_Controller = TextEditingController();


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Add Expense'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              controller: title_Controller,
              decoration: InputDecoration(labelText: 'Title'),
            ),
            TextField(
              controller: amount_Controller,
              decoration: InputDecoration(labelText: 'Amount'),
              keyboardType: TextInputType.numberWithOptions(decimal: true),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                final title = title_Controller.text;
                final amount = double.tryParse(amount_Controller.text);

                if (title.isNotEmpty && amount != null) {
                  final expense = Expense(
                    id: DateTime.now().toString(),
                    title: title,
                    amount: amount,
                    date: DateTime.now(),
                  );

                  Provider.of<ExpProvider>(context, listen: false).createExpenses(expense);
                  Navigator.pop(context);
                }
              },
              child: Text('Add'),
            ),
          ],
        ),
      ),
    );
  }
}