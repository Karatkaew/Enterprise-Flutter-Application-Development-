import 'dart:io';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';

import '../../domain/entities/expense.dart';
import '../../domain/usecases/save_expense.dart';
import '../../domain/usecases/get_expenses.dart';

part 'expense_event.dart';
part 'expense_state.dart';

class ExpenseBloc extends Bloc<ExpenseEvent, ExpenseState> {

  final SaveExpense saveExpense;
  final GetExpenses getExpenses;

  ExpenseBloc({
    required this.saveExpense,
    required this.getExpenses,
  }) : super(ExpenseInitial()) {

    on<LoadExpenses>(_load);
    on<AddExpense>(_add);
    on<ScanReceiptEvent>(_scanReceipt);
  }

  Future<void> _load(
    LoadExpenses event,
    Emitter<ExpenseState> emit,
  ) async {

    emit(ExpenseLoading());

    final result = await getExpenses();

    result.fold(
      (l) => emit(ExpenseError(l.message)),
      (r) => emit(ExpenseLoaded(r)),
    );
  }

  Future<void> _add(
    AddExpense event,
    Emitter<ExpenseState> emit,
  ) async {

    final result = await saveExpense(event.expense);

    result.fold(
      (l) => emit(ExpenseError(l.message)),
      (_) => add(LoadExpenses()),
    );
  }

  Future<void> _scanReceipt(
    ScanReceiptEvent event,
    Emitter<ExpenseState> emit,
  ) async {

    emit(ExpenseLoading());

    try {

      final amount = _extractTotal(event.text);

      final expense = Expense(
        id: 0,
        store: "Receipt",
        amount: amount,
        category: "Food",
        date: DateTime.now(),
      );

      final result = await saveExpense(expense);

      result.fold(
        (l) => emit(ExpenseError(l.message)),
        (_) => add(LoadExpenses()),
      );

    } catch (e) {

      emit(ExpenseError(e.toString()));

    }
  }

  double _extractTotal(String text) {

    final regex = RegExp(r'(\d+\.\d{2})');

    final matches = regex.allMatches(text);

    if (matches.isNotEmpty) {
      return double.tryParse(matches.last.group(0)!) ?? 0;
    }

    return 0;
  }
}