import 'package:dartz/dartz.dart';
import '../../../../core/error/failure.dart';
import '../entities/expense.dart';
import '../repositories/expense_repository.dart';

class GetExpenses {

  final ExpenseRepository repository;

  GetExpenses(this.repository);

  Future<Either<Failure, List<Expense>>> call() {
    return repository.getExpenses();
  }
}