
import 'package:flutter/material.dart';
import 'package:auto_route/auto_route.dart';
import '../../../../routes/app_router.dart';

@RoutePage()
class DashboardPage extends StatefulWidget {

  const DashboardPage({super.key});

  @override
  State<DashboardPage> createState() => _DashboardPageState();
}

class _DashboardPageState extends State<DashboardPage> {

  bool expanded = false;

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        title: const Text("Dashboard"),
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

            ElevatedButton(
              onPressed: () {
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

