import 'package:flutter/cupertino.dart';
import '../features/add_expense.dart';
import '../features/expense.dart';
import '../features/get_expenses.dart';
import '../features/remove_expense.dart';

class ExpProvider with ChangeNotifier{
  final GetExpenses getExpenses;
  final AddExpense addExpense;
  final RemoveExpense removeExpense;

  List<Expense> expenses_ = [];
  List<Expense> get expenses => expenses_;

  ExpProvider(
   {
     required this.getExpenses,
     required this.addExpense,
     required this.removeExpense,
});

  Future<void> loadExpenses() async{
    expenses_ = await getExpenses();
    notifyListeners();
  }

  Future<void> createExpenses(Expense expense) async{
    await addExpense(expense);
    loadExpenses();
  }

  Future<void> deleteExpenses(String id) async{
    await removeExpense(id);
    loadExpenses();
  }

}