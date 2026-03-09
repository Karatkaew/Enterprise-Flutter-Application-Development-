import 'package:get_it/get_it.dart';
import '../services/ai_service.dart';

final getIt = GetIt.instance;

void setupDI() {
  getIt.registerLazySingleton(() => AIService());
}