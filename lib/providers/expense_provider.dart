import 'package:flutter/material.dart';
import 'package:drift/drift.dart';
import '../features/expense/domain/entities/expense.dart';
import '../features/expense/data/database/app_database.dart' as db;

/// A simple provider that loads expenses from the local database.
///
/// If the database is empty, a small set of demo expenses are inserted.
class ExpenseProvider extends ChangeNotifier {
  final db.AppDatabase _database;

  List<Expense> _expenses = [];
  Expense? _selectedExpense;

  ExpenseProvider() : _database = db.AppDatabase() {
    _init();
  }

  List<Expense> get expenses => List.unmodifiable(_expenses);
  Expense? get selectedExpense => _selectedExpense;

  Future<void> _init() async {
    await _ensureDemoData();
    await refresh();
  }

  Future<void> refresh() async {
    final query = _database.select(_database.expenses)
      ..orderBy([(t) => OrderingTerm(expression: t.date, mode: OrderingMode.desc)]);

    final all = await query.get();

    _expenses = all
        .map((e) => Expense(
              id: e.id,
              store: e.title,
              amount: e.amount,
              category: _guessCategory(e.title),
              date: e.date,
            ))
        .toList();

    notifyListeners();
  }

  void select(Expense expense) {
    _selectedExpense = expense;
    notifyListeners();
  }

  Future<void> _ensureDemoData() async {
    final existing = await _database.select(_database.expenses).get();
    if (existing.isNotEmpty) return;

    final now = DateTime.now();

    _database.batch((batch) {
      batch.insert(
        _database.expenses,
        db.ExpensesCompanion.insert(
          title: 'Coffee Shop',
          amount: 4.50,
          date: now.subtract(const Duration(days: 1)),
        ),
      );
      batch.insert(
        _database.expenses,
        db.ExpensesCompanion.insert(
          title: 'Grocery Store',
          amount: 68.20,
          date: now.subtract(const Duration(days: 2)),
        ),
      );
      batch.insert(
        _database.expenses,
        db.ExpensesCompanion.insert(
          title: 'Online Subscription',
          amount: 12.99,
          date: now.subtract(const Duration(days: 5)),
        ),
      );
    });
  }

  String _guessCategory(String title) {
    final lower = title.toLowerCase();
    if (lower.contains('coffee') || lower.contains('cafe')) return 'Food';
    if (lower.contains('grocery') || lower.contains('store')) return 'Groceries';
    if (lower.contains('subscription') || lower.contains('online')) return 'Subscriptions';
    return 'Other';
  }
}
