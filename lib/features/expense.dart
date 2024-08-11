// create class Expense

class Expense{
  final String id;
  final String title;
  final double amount;
  final DateTime date;

  Expense({
    required this.title,
    required this.amount,
    required this.date,
    required this.id,
});

}