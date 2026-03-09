import 'package:json_annotation/json_annotation.dart';
import '../../domain/entities/expense.dart';

part 'expense_model.g.dart';

@JsonSerializable()
class ExpenseModel extends Expense {

  ExpenseModel({
    super.id,
    required super.store,
    required super.amount,
    required super.category,
    required super.date,
  });

  factory ExpenseModel.fromJson(Map<String, dynamic> json) =>
      _$ExpenseModelFromJson(json);

  Map<String, dynamic> toJson() => _$ExpenseModelToJson(this);
}