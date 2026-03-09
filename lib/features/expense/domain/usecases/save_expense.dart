import 'package:dartz/dartz.dart';
import '../../../../core/error/failure.dart';
import '../entities/expense.dart';
import '../repositories/expense_repository.dart';

class SaveExpense {

  final ExpenseRepository repository;

  SaveExpense(this.repository);

  Future<Either<Failure, void>> call(Expense expense) {
    return repository.saveExpense(expense);
  }
}