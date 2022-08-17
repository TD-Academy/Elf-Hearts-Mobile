import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;
import 'package:users/models/user_model.dart';
import 'package:users/services/auth_service.dart';
import 'package:users/services/storage_service.dart';
import 'package:users/models/response_model.dart';
import 'dart:async';

enum AuthStatus { authorized, unauthorized }

class AuthController extends ChangeNotifier {
  static const String signInEndpoint = "/signIn";
  static const String signUpEndpoint = "/signUp";
  final storage = LocalStorageService();
  final user = Users();
  bool isBack = false;
  late final AuthStatus status;


  // when start checktoken
  // and tokeninterval

  tokenInterval() {
    Timer.periodic(const Duration(minutes: 15), (timer) {
      checkToken();
    });
  }

  checkToken() async {
    try {
      if(await storage.readData(StorageKey.accessToken) != null) {
        status = AuthStatus.authorized;
        notifyListeners();
      } else {
        logOut();
      }
    } on Exception catch(e) {
      logOut();
    }
  }

  logOut() {
    storage.deleteData(StorageKey.accessToken);
    storage.deleteData(StorageKey.refreshToken);
    status = AuthStatus.unauthorized;
    notifyListeners();
  }

  signIn({
    required String userName,
    required String password
  }) async {
    try {
      final body = {userName: userName, password: password};
      http.Response response = (await postData(body, signInEndpoint))!;
      final responseBody = jsonDecode(response.body);
      final accessToken = responseBody['access_token'];
      final refreshToken = responseBody['refresh_token'];
      await storage.writeData(StorageKey.accessToken, accessToken);
      await storage.writeData(StorageKey.refreshToken, refreshToken);
      if (response.statusCode == 201) {
        isBack = true;
      }
      notifyListeners();
      await tokenInterval();
    }
    catch(e) {
      print(e);
      logOut();
    }
    notifyListeners();
  }

  

  Future<void> signUp(Users body) async {
    try {
      http.Response response = (await postData(body, signUpEndpoint))!;
      final responseBody = jsonDecode(response.body);
      final id = responseBody['id'];
      // await storage.writeData(StorageKey.userId, id);
      if (response.statusCode == 201) {
        isBack = true;
      }
      notifyListeners();
      // otp page connect and check
    }
    catch(e) {
      print(e);
    }
    notifyListeners();
  }
}

// function to refresh access token with refresh token