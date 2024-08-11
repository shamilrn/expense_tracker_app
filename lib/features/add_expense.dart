import 'package:personal_expense_tracker/features/exp_repository.dart';
import 'package:personal_expense_tracker/features/expense.dart';

class AddExpense {
  final ExpRepository repository;

  AddExpense(this.repository);

  Future<void> call(Expense expense)async{
    return await repository.addExpense(expense);
  }
}
