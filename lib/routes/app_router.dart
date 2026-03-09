
import 'package:flutter/material.dart';
import 'package:auto_route/auto_route.dart';

import '../features/expense/presentation/pages/dashboard_page.dart';
import '../features/expense/presentation/pages/scan_receipt_page.dart';
import '../features/expense/presentation/pages/add_expense_page.dart';
import '../features/expense/presentation/pages/expense_detail_page.dart';

part 'app_router.gr.dart';

@AutoRouterConfig()
class AppRouter extends RootStackRouter {

  @override
  List<AutoRoute> get routes => [
    AutoRoute(page: DashboardRoute.page, initial: true),
    AutoRoute(page: ScanReceiptRoute.page),
    AutoRoute(page: AddExpenseRoute.page),
    AutoRoute(page: ExpenseDetailRoute.page),
  ];
}

