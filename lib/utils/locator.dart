import 'package:get_it/get_it.dart';
import 'package:news_app/services/database_service.dart';
import 'package:news_app/services/encryption_service.dart';

final serviceLocator = GetIt.instance;

Future<void> locatorSetUp() async {
  // locator.registerLazySingleton(() => ApiClient());
  serviceLocator
      .registerLazySingleton<DatabaseService>(() => DatabaseServiceImpl());
  serviceLocator
      .registerLazySingleton<EncryptionService>(() => EncryptionServiceImpl());
}
