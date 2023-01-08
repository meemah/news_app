import 'package:hive_flutter/hive_flutter.dart';

part 'news_user.g.dart';

@HiveType(typeId: 1)
class NewsUser {
  @HiveField(0)
  final String email;
  @HiveField(1)
  final String userName;
  @HiveField(2)
  final String encrpytedPassword;
  @HiveField(3)
  final String userKeyString;
  NewsUser(
      {required this.email,
      required this.userName,
      required this.userKeyString,
      required this.encrpytedPassword});
}
