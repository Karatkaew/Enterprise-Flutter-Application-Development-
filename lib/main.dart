import 'package:flutter/material.dart';
import 'routes/app_router.dart';
import 'core/di/injection.dart';
import 'package:provider/provider.dart';
import 'providers/theme_provider.dart';

final appRouter = AppRouter();   // ⭐ เพิ่มบรรทัดนี้

void main() {

  setupDI();

  runApp(
    ChangeNotifierProvider(
      create: (_) => ThemeProvider(),
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
  theme: ThemeData(
    useMaterial3: true,
    colorSchemeSeed: Colors.teal,
    brightness: Brightness.light,
  ),
  darkTheme: ThemeData(
    useMaterial3: true,
    brightness: Brightness.dark,
  ),
  themeMode: themeProvider.themeMode,
  routerConfig: appRouter.config(),
);
  }
}