part of 'expense_bloc.dart';

abstract class ExpenseEvent {}

class LoadExpenses extends ExpenseEvent {}

class AddExpense extends ExpenseEvent {
  final Expense expense;

  AddExpense(this.expense);
}

class ScanReceiptEvent extends ExpenseEvent {
  final File image;

  ScanReceiptEvent(this.image);
}
class ScanReceiptEvent extends ExpenseEvent {

  final String text;

  ScanReceiptEvent(this.text);

}