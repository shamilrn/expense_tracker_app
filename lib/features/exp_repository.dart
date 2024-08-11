import 'package:personal_expense_tracker/features/expense.dart';

abstract class ExpRepository{
  Future<List<Expense>> getExpenses();
  Future<void> addExpense(Expense expense);
  Future<void> removeExpense(String id);
}