import 'package:hive_flutter/hive_flutter.dart';
import 'package:news_app/models/news_user.dart';
import 'package:news_app/services/encryption_service.dart';
import 'package:news_app/utils/database_constants.dart';
import 'package:news_app/utils/locator.dart';

abstract class DatabaseService {
  Future initDatabase();
  Future saveUser(
      {required String name, required String email, required String password});
  Future<NewsUser?> getUser({required String email, required String password});
}

class DatabaseServiceImpl extends DatabaseService {
  final EncryptionService _encryptionService =
      serviceLocator<EncryptionService>();
  @override
  Future initDatabase() async {
    await Hive.initFlutter();
    Hive.registerAdapter<NewsUser>(NewsUserAdapter());
    await Hive.openBox<NewsUser>(HiveDatabaseConst.userBoxName);
  }

  @override
  Future<NewsUser?> getUser(
      {required String email, required String password}) async {
    Box<NewsUser> usersBox = Hive.box(HiveDatabaseConst.userBoxName);
    List<NewsUser> allUsers = usersBox.values.toList();

    List<NewsUser> validUsers = allUsers
        .where(
          (element) =>
              element.email == email &&
              (_encryptionService.decryptPassword(
                      encrptedPassword: element.encrpytedPassword,
                      keyString: element.userKeyString) ==
                  password),
        )
        .toList();

    return validUsers.isNotEmpty ? validUsers[0] : null;
  }

  @override
  Future saveUser(
      {required String name,
      required String email,
      required String password}) async {
    Box<NewsUser> usersBox = Hive.box(HiveDatabaseConst.userBoxName);
    List<NewsUser> allUsers = usersBox.values.toList();
    List<NewsUser> validUsers =
        allUsers.where((element) => element.email == email).toList();

    if (validUsers.isEmpty) {
      String keyString = _encryptionService.genarateRandomId();
      String encryptedPassword = _encryptionService.encryptPassword(
          password: password, keyString: keyString);

      return usersBox.add(NewsUser(
        email: email,
        encrpytedPassword: encryptedPassword,
        userName: name,
        userKeyString: keyString,
      ));
    } else {
      throw ("User already exist");
    }
  }
}
