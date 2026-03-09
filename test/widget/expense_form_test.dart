import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:myapp/features/expense/presentation/pages/add_expense_page.dart';

void main() {

  testWidgets('Form validation test', (WidgetTester tester) async {

    await tester.pumpWidget(

      const MaterialApp(
        home: AddExpensePage(),
      ),

    );

    // กด Save โดยไม่กรอกข้อมูล
    await tester.tap(find.text("Save Expense"));

    await tester.pump();

    // ต้องเจอ Required 2 ช่อง
    expect(find.text('Required'), findsNWidgets(2));

  });

}