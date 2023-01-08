import 'package:flutter/material.dart';
import 'package:news_app/models/news_user.dart';
import 'package:news_app/services/database_service.dart';
import 'package:news_app/services/networking_service.dart/data_response.dart';
import 'package:news_app/utils/locator.dart';

class SignInViewmodel extends ChangeNotifier {
  final DatabaseService _databaseService = serviceLocator<DatabaseService>();
  NetworkDataResponse<NewsUser> _signInResponse = NetworkDataResponse.idle();

  NetworkDataResponse<NewsUser> get signInResponse => _signInResponse;

  set signInResponse(NetworkDataResponse<NewsUser> signInResponse) {
    _signInResponse = signInResponse;
    notifyListeners();
  }

  signIn({required String email, required String password}) async {
    try {
      signInResponse = NetworkDataResponse.loading("Signing up");
      NewsUser? user =
          await _databaseService.getUser(email: email, password: password);
      if (user != null) {
        signInResponse = NetworkDataResponse.completed(user);
      } else {
        signInResponse = NetworkDataResponse.error("Incorrect email/password");
      }
    } catch (e) {
      signInResponse = NetworkDataResponse.error(e.toString());
    }
  }
}
