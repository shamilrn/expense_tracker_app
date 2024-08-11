import 'package:personal_expense_tracker/features/exp_repository.dart';

class RemoveExpense{
  final ExpRepository repository;
  RemoveExpense(this.repository);

  Future<void> call(String id)async{
    return await repository.removeExpense(id);
  }
}