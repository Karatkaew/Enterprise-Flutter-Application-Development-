// dart format width=80
// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouterGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

part of 'app_router.dart';

/// generated route for
/// [AddExpensePage]
class AddExpenseRoute extends PageRouteInfo<void> {
  const AddExpenseRoute({List<PageRouteInfo>? children})
    : super(AddExpenseRoute.name, initialChildren: children);

  static const String name = 'AddExpenseRoute';

  static PageInfo page = PageInfo(
    name,
    builder: (data) {
      return const AddExpensePage();
    },
  );
}

/// generated route for
/// [DashboardPage]
class DashboardRoute extends PageRouteInfo<void> {
  const DashboardRoute({List<PageRouteInfo>? children})
    : super(DashboardRoute.name, initialChildren: children);

  static const String name = 'DashboardRoute';

  static PageInfo page = PageInfo(
    name,
    builder: (data) {
      return const DashboardPage();
    },
  );
}

/// generated route for
/// [ExpenseDetailPage]
class ExpenseDetailRoute extends PageRouteInfo<ExpenseDetailRouteArgs> {
  ExpenseDetailRoute({
    Key? key,
    required String imagePath,
    List<PageRouteInfo>? children,
  }) : super(
         ExpenseDetailRoute.name,
         args: ExpenseDetailRouteArgs(key: key, imagePath: imagePath),
         initialChildren: children,
       );

  static const String name = 'ExpenseDetailRoute';

  static PageInfo page = PageInfo(
    name,
    builder: (data) {
      final args = data.argsAs<ExpenseDetailRouteArgs>();
      return ExpenseDetailPage(key: args.key, imagePath: args.imagePath);
    },
  );
}

class ExpenseDetailRouteArgs {
  const ExpenseDetailRouteArgs({this.key, required this.imagePath});

  final Key? key;

  final String imagePath;

  @override
  String toString() {
    return 'ExpenseDetailRouteArgs{key: $key, imagePath: $imagePath}';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    if (other is! ExpenseDetailRouteArgs) return false;
    return key == other.key && imagePath == other.imagePath;
  }

  @override
  int get hashCode => key.hashCode ^ imagePath.hashCode;
}

/// generated route for
/// [ScanReceiptPage]
class ScanReceiptRoute extends PageRouteInfo<void> {
  const ScanReceiptRoute({List<PageRouteInfo>? children})
    : super(ScanReceiptRoute.name, initialChildren: children);

  static const String name = 'ScanReceiptRoute';

  static PageInfo page = PageInfo(
    name,
    builder: (data) {
      return const ScanReceiptPage();
    },
  );
}
