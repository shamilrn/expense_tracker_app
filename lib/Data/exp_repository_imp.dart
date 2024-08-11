import 'package:personal_expense_tracker/features/exp_repository.dart';
import 'package:personal_expense_tracker/features/expense.dart';

import 'exp_local_data.dart';

class ExpRepositoryImp implements ExpRepository{
  final ExpLocalData localData;
  ExpRepositoryImp(this.localData);

  @override
  Future<List<Expense>> getExpenses() async {
    return await localData.getExpenses();
  }

  @override
  Future<void> addExpense(Expense expense) async{
    await localData.addExpense(expense);
  }

  @override
Future<void> removeExpense(String id) async{
    await localData.removeExpense(id);
  }
}