
import '../../domain/entities/expense.dart';
import '../database/app_database.dart' as db;

class ExpenseLocalDatasource {

  final db.AppDatabase database;

  ExpenseLocalDatasource(this.database);

  Future<void> insertExpense(Expense expense) async {

    await database.into(database.expenses).insert(
      db.ExpensesCompanion.insert(
        store: expense.store,
        amount: expense.amount,
        category: expense.category,
        date: expense.date,
      ),
    );

  }

  Future<List<Expense>> getExpenses() async {

    final result = await database.select(database.expenses).get();

    return result
        .map((e) => Expense(
              id: e.id,
              store: e.store,
              amount: e.amount,
              category: e.category,
              date: e.date,
            ))
        .toList();

  }

}

