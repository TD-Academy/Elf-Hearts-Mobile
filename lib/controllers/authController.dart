import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;
import 'package:users/models/authModels.dart';
import 'package:users/services/authServices.dart';
import 'package:users/services/storage_service.dart';
import 'package:users/models/responseModels.dart';

enum Status { authorized, uninitialized, unauthorized }

class AuthController extends ChangeNotifier {
  LocalStorageService storage = LocalStorageService();
  bool loading = false;
  bool isBack = false;
  var status;

  tokenCheck() {
    if (storage.readSecureData(StorageKey.accessToken) != null) {
      status = Status.authorized;
      notifyListeners();
    } else {
      // check if refresh token is there if not log out
      // if refresh token is there refresh access token
      status = Status.unauthorized;
      notifyListeners();
    }
  }

  Future<void> authUser(SignInBody body) async {
    loading = true;
    notifyListeners();
    http.Response response = (await signIn(body))!;
    if (response.statusCode == 401) {
      print('User Not Found!');
    }
    SignInResponse signInResponse = SignInResponse(resp: response);
    signInResponse.toJson();

    // await storageService.deleteAllSecureData();
    if (response.statusCode == 201) {
      isBack = true;
      Status.authorized;
    } else {
      Status.unauthorized;
    }
    loading = false;
    notifyListeners();
  }

  Future<void> createUser(SignUpBody body) async {
    loading = true;
    notifyListeners();
    http.Response response = (await register(body))!;
    if (response.statusCode == 200) {
      isBack = true;
      Status.authorized;
    }
    loading = false;
    notifyListeners();
  }
}
