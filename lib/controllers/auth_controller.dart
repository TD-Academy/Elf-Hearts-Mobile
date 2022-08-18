import 'dart:convert';
import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;
import 'package:users/models/user_model.dart';
import 'package:users/services/auth_service.dart';
import 'package:users/services/storage_service.dart';
import 'package:users/models/responses/auth_responses.dart';
import 'dart:async';

enum AuthStatus { authorized, unauthorized, loading }

class AuthController extends ChangeNotifier {
  static const String signInEndpoint = "/signIn";
  static const String signUpEndpoint = "/signUp";
  static const String otpEndpoint = "/approve";
  final storage = LocalStorageService();
  bool isBack = false;
  AuthStatus status = AuthStatus.loading;

  AuthController() {
    init();
  }

  void init() async {
    await checkToken();
  }

  tokenInterval() {
    Timer.periodic(const Duration(minutes: 15), (timer) {
      checkToken();
    });
  }

  checkToken() async {
    try {
      if (await storage.readData(StorageKey.accessToken) != null) {
        status = AuthStatus.authorized;
        notifyListeners();
      } else {
        status = AuthStatus.unauthorized;
        notifyListeners();
        // logOut();
      }
    } on Exception catch (e) {
      print(e);
      logOut();
    }
  }

  logOut() async {
    await storage.deleteData(StorageKey.accessToken);
    await storage.readAllData();
    status = AuthStatus.unauthorized;
    notifyListeners();
  }

  Future<void> signIn(Users body) async {
    try {
      http.Response response = (await postData(body, signInEndpoint))!;
      final responseBody = jsonDecode(response.body);
      AuthResponse authResponse = AuthResponse.fromJson(responseBody);
      final accessToken = authResponse.accessToken;
      final refreshToken = authResponse.refreshToken;
      final userName = authResponse.userName;
      final userId = authResponse.id;
      await storage.writeData(StorageKey.accessToken, accessToken);
      await storage.writeData(StorageKey.refreshToken, refreshToken);
      await storage.writeData(StorageKey.userName, userName);
      await storage.writeData(StorageKey.userId, userId);
      if (response.statusCode == 201) {
        isBack = true;
        status = AuthStatus.authorized;
        notifyListeners();
      }

      await tokenInterval();
    } catch (e) {
      print(e);
      logOut();
    }
    notifyListeners();
  }

  Future<void> changePass(Users body) async {
    try {
      http.Response response = (await postData(body, ))
    }
  }

  Future<void> verify(Users body) async {
    try {
      print(body.id);
      http.Response response = (await postData(body, otpEndpoint))!;
      print(response.statusCode);
      final responseBody = jsonDecode(response.body);
      AuthResponse authResponse = AuthResponse.fromJson(responseBody);
      print(authResponse.accessToken);
      print(responseBody['access_token']);
      final accessToken = authResponse.accessToken;
      final refreshToken = authResponse.refreshToken;
      final userName = authResponse.userName;
      final userId = authResponse.id;
      await storage.writeData(StorageKey.accessToken, accessToken);
      await storage.writeData(StorageKey.refreshToken, refreshToken);
      await storage.writeData(StorageKey.userName, userName);
      await storage.writeData(StorageKey.userId, userId);
      if (response.statusCode == 201) {
        isBack = true;
        status = AuthStatus.authorized;
        notifyListeners();
      }
      await tokenInterval();
  } catch (e) {
    print(e);
    logOut();
  }
  notifyListeners();
  }


  Future<void> signUp(Users body) async {
    try {
      http.Response response = (await postData(body, signUpEndpoint))!;
      print(response.statusCode);
      print(response.body);
      final responseBody = jsonDecode(response.body);
      AuthResponse authResponse = AuthResponse.fromJson(responseBody);
      final id = authResponse.id;
      await storage.writeData(StorageKey.userId, id);
      if (response.statusCode == 201) {
        isBack = true;
      }
      await tokenInterval();
      notifyListeners();
      // otp page connect and check
    } catch (e) {
      print(e);
    }
    notifyListeners();
  }
}

// function to refresh access token with refresh token