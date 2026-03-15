import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:provider/provider.dart';

import 'package:myapp/features/expense/presentation/pages/add_expense_page.dart';
import 'package:myapp/providers/theme_provider.dart';
import 'package:myapp/providers/expense_provider.dart';

void main() {

  testWidgets('Form validation test', (WidgetTester tester) async {

    await tester.pumpWidget(
      MultiProvider(
        providers: [
          ChangeNotifierProvider(create: (_) => ThemeProvider()),
          ChangeNotifierProvider(create: (_) => ExpenseProvider()),
        ],
        child: const MaterialApp(
          home: AddExpensePage(),
        ),
      ),
    );

    // กด Save โดยไม่กรอกข้อมูล
    await tester.tap(find.text("Save Expense"));

    await tester.pump();

    // ต้องเจอ Required 2 ช่อง
    expect(find.text('Required'), findsNWidgets(2));

  });

}