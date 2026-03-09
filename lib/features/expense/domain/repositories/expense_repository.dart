import 'package:dartz/dartz.dart';
import '../../../../core/error/failure.dart';
import '../entities/expense.dart';

abstract class ExpenseRepository {

  Future<Either<Failure, void>> saveExpense(Expense expense);

  Future<Either<Failure, List<Expense>>> getExpenses();
}