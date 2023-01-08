import 'package:flutter/material.dart';

import 'package:news_app/services/database_service.dart';
import 'package:news_app/services/networking_service.dart/data_response.dart';
import 'package:news_app/utils/locator.dart';

class SignUpViewmodel extends ChangeNotifier {
  final DatabaseService _databaseService = serviceLocator<DatabaseService>();
  NetworkDataResponse<bool> _signUpResponse = NetworkDataResponse.idle();

  NetworkDataResponse<bool> get signUpResponse => _signUpResponse;

  set signUpResponse(NetworkDataResponse<bool> signUpResponse) {
    _signUpResponse = signUpResponse;
    notifyListeners();
  }

  signUp(
      {required String name,
      required String email,
      required String password}) async {
    try {
      signUpResponse = NetworkDataResponse.loading("Signing up");
      await _databaseService.saveUser(
          name: name, email: email, password: password);
      signUpResponse = NetworkDataResponse.completed(true);
    } catch (e) {
      signUpResponse = NetworkDataResponse.error(e.toString());
    }
  }
}
