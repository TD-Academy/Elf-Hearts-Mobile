import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;
import 'package:users/models/signInModel.dart';
import 'package:users/models/signUpModel.dart';
import 'package:users/services/signInService.dart';
class SignInClass extends ChangeNotifier {
  bool loading = false;
  bool isBack = false;
  Future<void> postData(SignInBody body) async {
    loading = true;
    notifyListeners();
    http.Response response = (await signIn(body))!;
    if (response.statusCode == 200) {
      isBack = true;
    }
    loading = false;
    notifyListeners();
  }
}
