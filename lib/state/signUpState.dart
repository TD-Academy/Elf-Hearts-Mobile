import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;
import 'package:users/services/signUpService.dart';
import 'package:users/models/signUpModel.dart';

// State Management for Sign Up
// Test hiij uzeegu bga odoogoor

class DataClass extends ChangeNotifier {
  bool loading = false;
  bool isBack = false;
  Future<void> postData(SignUpBody body) async {
    loading = true;
    notifyListeners();
    http.Response response = (await register(body))!;
    if (response.statusCode == 200) {
      isBack = true;
    }
    loading = false;
    notifyListeners();
  }
}
