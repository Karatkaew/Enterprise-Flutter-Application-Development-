import 'package:equatable/equatable.dart';

class Expense extends Equatable {
  final int? id;
  final String store;
  final double amount;
  final String category;
  final DateTime date;

  const Expense({
    this.id,
    required this.store,
    required this.amount,
    required this.category,
    required this.date,
  });

  @override
  List<Object?> get props => [id, store, amount, category, date];
}