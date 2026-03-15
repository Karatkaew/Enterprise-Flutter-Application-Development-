
import 'package:flutter/material.dart';
import 'package:auto_route/auto_route.dart';
import '../../../../routes/app_router.dart';
import 'package:provider/provider.dart';
import '../../../../providers/theme_provider.dart';
import '../../../../providers/expense_provider.dart';

@RoutePage()
class DashboardPage extends StatefulWidget {

  const DashboardPage({super.key});

  @override
  State<DashboardPage> createState() => _DashboardPageState();
}

class _DashboardPageState extends State<DashboardPage> {

  bool expanded = false;

  Widget _buildExpenseList(BuildContext context, ExpenseProvider provider) {
    if (provider.expenses.isEmpty) {
      return const Padding(
        padding: EdgeInsets.symmetric(horizontal: 24.0),
        child: Text(
          "No expenses yet.",
          style: TextStyle(fontSize: 16, color: Colors.grey),
          textAlign: TextAlign.center,
        ),
      );
    }

    return Column(
      children: provider.expenses.map((expense) {
        return Padding(
          padding: const EdgeInsets.symmetric(vertical: 6.0, horizontal: 16.0),
          child: Card(
            child: ListTile(
              title: Text(expense.store),
              subtitle: Text(
                "${expense.category} • ${expense.date.toLocal().toString().split(' ').first}",
              ),
              trailing: Text(
                "\$${expense.amount.toStringAsFixed(2)}",
                style: const TextStyle(fontWeight: FontWeight.bold),
              ),
              onTap: () {
                provider.select(expense);
                context.router.push(
                  ExpenseDetailRoute(
                    imagePath: "sample_receipt.jpg",
                  ),
                );
              },
            ),
          ),
        );
      }).toList(),
    );
  }

  @override
  Widget build(BuildContext context) {

    final themeProvider = Provider.of<ThemeProvider>(context);
    final expenseProvider = Provider.of<ExpenseProvider>(context);

    return Scaffold(
      appBar: AppBar(
        title: const Text("Dashboard"),
        actions: [
          IconButton(
            icon: Icon(
              themeProvider.isDark ? Icons.light_mode : Icons.dark_mode,
            ),
            onPressed: () => themeProvider.toggleTheme(),
          ),
        ],
      ),

      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [


            GestureDetector(
              onTap: () {
                setState(() {
                  expanded = !expanded;
                });
              },

              child: Hero(
                tag: "receiptImage",
                child: AnimatedContainer(
                  duration: const Duration(milliseconds: 300),
                  width: expanded ? 220 : 140,
                  height: 120,
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                    color: Colors.blue,
                    borderRadius: BorderRadius.circular(16),
                  ),

                  child: const Text(
                    "Expense Dashboard",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 18,
                    ),
                  ),
                ),
              ),
            ),

            const SizedBox(height: 40),

            /// Demo Expense List
            _buildExpenseList(context, expenseProvider),

            const SizedBox(height: 20),

            ElevatedButton(
              onPressed: () {
                if (expenseProvider.expenses.isNotEmpty) {
                  expenseProvider.select(expenseProvider.expenses.first);
                }
                context.router.push(
                  ExpenseDetailRoute(
                    imagePath: "sample_receipt.jpg",
                  ),
                );
              },
              child: const Text("Open Detail"),
            ),

            const SizedBox(height: 16),

            ElevatedButton(
              onPressed: () {
                context.router.push(const ScanReceiptRoute());
              },
              child: const Text("Scan Receipt"),
            ),

          ],
        ),
      ),
    );
  }
}

