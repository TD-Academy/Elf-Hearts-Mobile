import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;
import 'package:users/models/signInModel.dart';
import 'package:users/services/signInService.dart';
import 'package:users/services/storage_service.dart';


LocalStorageService storageService = LocalStorageService();


class SignInClass extends ChangeNotifier {
  bool loading = false;
  bool isBack = false;
  var responseBody;
  Future<void> postData(SignInBody body) async {
    loading = true;
    notifyListeners();
    http.Response response = (await signIn(body))!;
    responseBody = jsonDecode(response.body);
    await storageService.writeSecureData('KEY_USERID', responseBody['user']['id']);
    await storageService.writeSecureData('KEY_USERNAME', responseBody['user']['userName']);
    await storageService.writeSecureData('KEY_ACCESS_TOKEN', responseBody['access_token']);
    await storageService.writeSecureData('KEY_REFRESH_TOKEN', responseBody['refresh_token']);
    // await storageService.deleteAllSecureData();
    if (response.statusCode == 201) {
      isBack = true;
    }
    loading = false;
    notifyListeners();
  }
}
