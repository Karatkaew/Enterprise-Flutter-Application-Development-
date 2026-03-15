import 'dart:io';
import 'package:flutter/material.dart';
import 'package:auto_route/auto_route.dart';
import 'package:provider/provider.dart';
import '../../../../providers/theme_provider.dart';
import '../../../../providers/expense_provider.dart';

@RoutePage()
class ExpenseDetailPage extends StatelessWidget {

  final String? imagePath;

  const ExpenseDetailPage({
    super.key,
    this.imagePath,
  });

  @override
  Widget build(BuildContext context) {

    final themeProvider = Provider.of<ThemeProvider>(context);
    final expenseProvider = Provider.of<ExpenseProvider>(context);

    File? file;

    if (imagePath != null) {
      file = File(imagePath!);
    }

    final expense = expenseProvider.selectedExpense;

    return Scaffold(
      appBar: AppBar(
        title: const Text("Expense Detail"),
        centerTitle: true,
        actions: [
          IconButton(
            icon: Icon(
              themeProvider.isDark ? Icons.light_mode : Icons.dark_mode,
            ),
            onPressed: () => themeProvider.toggleTheme(),
          ),
        ],
      ),

      body: Padding(
        padding: const EdgeInsets.all(16),
        child: expense != null
            ? Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Card(
                    child: ListTile(
                      leading: const Icon(Icons.attach_money),
                      title: const Text("Amount"),
                      subtitle: Text(expense.amount.toStringAsFixed(2)),
                    ),
                  ),

                  const SizedBox(height: 10),

                  Card(
                    child: ListTile(
                      leading: const Icon(Icons.store),
                      title: const Text("Merchant"),
                      subtitle: Text(expense.store),
                    ),
                  ),

                  const SizedBox(height: 10),

                  Card(
                    child: ListTile(
                      leading: const Icon(Icons.category),
                      title: const Text("Category"),
                      subtitle: Text(expense.category),
                    ),
                  ),

                  const SizedBox(height: 10),

                  Card(
                    child: ListTile(
                      leading: const Icon(Icons.calendar_today),
                      title: const Text("Date"),
                      subtitle: Text(expense.date.toLocal().toString().split(" ").first),
                    ),
                  ),

                  const SizedBox(height: 20),

                  /// Action Button
                  SizedBox(
                    height: 50,
                    child: ElevatedButton.icon(
                      icon: const Icon(Icons.check),
                      label: const Text("Save Expense"),
                      onPressed: () {
                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(
                            content: Text("Expense saved"),
                          ),
                        );
                      },
                    ),
                  ),
                ],
              )
            : (file != null && file.existsSync()
                ? Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [

                      /// Receipt Image
                      Hero(
                        tag: "receiptImage",
                        child: Card(
                          elevation: 4,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(16),
                          ),
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(16),
                            child: Image.file(
                              file,
                              height: 260,
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                      ),

                      const SizedBox(height: 20),

                      /// Expense Information
                      Card(
                        child: ListTile(
                          leading: const Icon(Icons.attach_money),
                          title: const Text("Amount"),
                          subtitle: const Text("128.40"),
                        ),
                      ),

                      const SizedBox(height: 10),

                      Card(
                        child: ListTile(
                          leading: const Icon(Icons.store),
                          title: const Text("Merchant"),
                          subtitle: const Text("Receipt Store"),
                        ),
                      ),

                      const SizedBox(height: 10),

                      Card(
                        child: ListTile(
                          leading: const Icon(Icons.calendar_today),
                          title: const Text("Date"),
                          subtitle: Text(
                            DateTime.now().toString().split(" ").first,
                          ),
                        ),
                      ),

                      const SizedBox(height: 20),

                      /// Action Button
                      SizedBox(
                        height: 50,
                        child: ElevatedButton.icon(
                          icon: const Icon(Icons.check),
                          label: const Text("Save Expense"),
                          onPressed: () {
                            ScaffoldMessenger.of(context).showSnackBar(
                              const SnackBar(
                                content: Text("Expense saved"),
                              ),
                            );
                          },
                        ),
                      ),
                    ],
                  )
                /// Empty State
                : const Center(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [

                        Icon(
                          Icons.receipt_long,
                          size: 100,
                          color: Colors.grey,
                        ),

                        SizedBox(height: 16),

                        Text(
                          "No receipt image",
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.w500,
                          ),
                        ),

                        SizedBox(height: 8),

                        Text(
                          "Scan a receipt to see details",
                          style: TextStyle(color: Colors.grey),
                        ),
                      ],
                    ),
                  )),
      ),
    );
  }
}