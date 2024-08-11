import 'package:personal_expense_tracker/features/expense.dart';

abstract class ExpLocalData{
  Future<List<Expense>> getExpenses();
  Future<void> addExpense(Expense expense);
  Future<void> removeExpense(String id);
}

class ExpLocalDataImp implements ExpLocalData{
  final List<Expense> expenses_ = [];

  @override
  Future<List<Expense>> getExpenses() async{
    return expenses_;
  }

  @override
  Future<void> addExpense(Expense expense) async{
    expenses_.add(expense);
  }

  @override
  Future<void> removeExpense(String id) async{
    expenses_.removeWhere((expense) => expense.id == id);
  }

}