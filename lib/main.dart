import 'package:flutter/material.dart';
import 'routes/app_router.dart';
import 'core/di/injection.dart';
import 'package:provider/provider.dart';
import 'providers/theme_provider.dart';
import 'providers/expense_provider.dart';

final appRouter = AppRouter();   // ⭐ เพิ่มบรรทัดนี้

final lightTheme = ThemeData(
  useMaterial3: true,
  colorSchemeSeed: Colors.teal,
  brightness: Brightness.light,
);

final darkTheme = ThemeData(
  useMaterial3: true,
  colorSchemeSeed: Colors.teal,
  brightness: Brightness.dark,
);

void main() {

  setupDI();

  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => ThemeProvider()),
        ChangeNotifierProvider(create: (_) => ExpenseProvider()),
      ],
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {

  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {

    final themeProvider = Provider.of<ThemeProvider>(context);

    return MaterialApp.router(
  theme: lightTheme,
  darkTheme: darkTheme,
  themeMode: themeProvider.themeMode,
  routerConfig: appRouter.config(),
);
  }
}