import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'add_exp_page.dart';
import 'exp_detail_page.dart';
import 'exp_provider.dart';

class ExpListPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Expense List"),
      ),
      body: Consumer<ExpProvider>(
        builder: (context, provider, child) {
          return ListView.builder(
            itemCount: provider.expenses.length,
            itemBuilder: (context, index) {
              final expense = provider.expenses[index];
              return ListTile(
                title: Text(expense.title),
                subtitle: Text('\$${expense.amount.toStringAsFixed(2)}'),
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => ExpDetailPage(expense: expense),
                    ),
                  );
                },
                trailing: IconButton(
                  icon: Icon(Icons.delete),
                  onPressed: () {
                    provider.deleteExpenses(expense.id);
                  },
                ),
              );
            },
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => AddExpPage()
            ),
          );
        },
      ),
    );
  }
}