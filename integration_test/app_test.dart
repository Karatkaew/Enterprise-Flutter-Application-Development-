import 'package:flutter_test/flutter_test.dart';
import 'package:integration_test/integration_test.dart';
import 'package:flutter/material.dart';

import 'package:myapp/features/expense/presentation/pages/add_expense_page.dart';

void main() {

  IntegrationTestWidgetsFlutterBinding.ensureInitialized();

  testWidgets("Add Expense flow works", (WidgetTester tester) async {

    await tester.pumpWidget(
      const MaterialApp(
        home: AddExpensePage(),
      ),
    );

    await tester.pumpAndSettle();

    // กรอก Title
    await tester.enterText(
      find.byType(TextFormField).at(0),
      "Coffee",
    );

    // กรอก Amount
    await tester.enterText(
      find.byType(TextFormField).at(1),
      "50",
    );

    // กด Save
    await tester.tap(find.text("Save"));

    await tester.pumpAndSettle();

    // ตรวจว่าไม่มี Required error
    expect(find.text("Required"), findsNothing);

  });

}