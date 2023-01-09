import 'package:get_it/get_it.dart';
import 'package:news_app/services/database_service.dart';
import 'package:news_app/services/encryption_service.dart';
import 'package:news_app/services/networking_service.dart/network_service.dart';
import 'package:news_app/services/news_service.dart';

final serviceLocator = GetIt.instance;

Future<void> locatorSetUp() async {
  serviceLocator
      .registerLazySingleton<DatabaseService>(() => DatabaseServiceImpl());
  serviceLocator
      .registerLazySingleton<EncryptionService>(() => EncryptionServiceImpl());
  serviceLocator.registerLazySingleton<NewsService>(() => NewsServiceImpl());
  serviceLocator
      .registerLazySingleton<NetworkService>(() => NetworkClientImpl());
}
