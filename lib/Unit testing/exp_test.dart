import 'package:personal_expense_tracker/UI/exp_provider.dart';
import 'package:personal_expense_tracker/features/add_expense.dart';
import 'package:personal_expense_tracker/features/get_expenses.dart';
import 'package:personal_expense_tracker/features/remove_expense.dart';
import 'package:mockito/mockito.dart';
import 'package:flutter_test/flutter_test.dart';

class MockGetExpenses extends Mock implements GetExpenses {}

class MockAddExpense extends Mock implements AddExpense {}

class MockRemoveExpense extends Mock implements RemoveExpense {}

void main() {
  late ExpProvider provider;
  late MockGetExpenses mockGetExpenses;
  late MockAddExpense mockAddExpense;
  late MockRemoveExpense mockRemoveExpense;

  setUp(() {
    mockGetExpenses = MockGetExpenses();
    mockAddExpense = MockAddExpense();
    mockRemoveExpense = MockRemoveExpense();
    provider = ExpProvider(
      getExpenses: mockGetExpenses,
      addExpense: mockAddExpense,
      removeExpense: mockRemoveExpense,
    );
  });

  test('initial state should be empty', () {
    expect(provider.expenses, []);
  });
}
