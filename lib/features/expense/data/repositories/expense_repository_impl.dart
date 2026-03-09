import 'package:dartz/dartz.dart';
import '../../../../core/error/failure.dart';
import '../../domain/entities/expense.dart';
import '../../domain/repositories/expense_repository.dart';
import '../datasources/expense_local_datasource.dart';
import '../models/expense_model.dart';

class ExpenseRepositoryImpl implements ExpenseRepository {

  final ExpenseLocalDatasource localDatasource;

  ExpenseRepositoryImpl(this.localDatasource);

  @override
  Future<Either<Failure, void>> saveExpense(Expense expense) async {

    try {

      await localDatasource.saveExpense(
        ExpenseModel.fromEntity(expense),
      );

      return const Right(null);

    } catch (e) {

      return Left(Failure(e.toString()));

    }

  }

  @override
  Future<Either<Failure, List<Expense>>> getExpenses() async {

    try {

      final result = await localDatasource.getExpenses();

      return Right(result);

    } catch (e) {

      return Left(Failure(e.toString()));

    }

  }

}