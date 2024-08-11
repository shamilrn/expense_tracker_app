import 'package:personal_expense_tracker/features/exp_repository.dart';
import 'package:personal_expense_tracker/features/expense.dart';

class GetExpenses{
   final ExpRepository repository;

   GetExpenses (this.repository);

   Future<List<Expense>> call()async{
      return await repository.getExpenses();
   }
}