import 'package:flutter/cupertino.dart';

// Minii state management hiih gej uzsen oroldlogo
// Not working

class UserLoginProvider extends ChangeNotifier {
  TextEditingController userNameController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  String _userName = '';
  String _password = '';

  String get userName => _userName;
  String get password => _password;

  void updateName(String name) {
    _userName = name;
    notifyListeners();
  }

  void updatePassword(String pass) {
    _password = pass;
    notifyListeners();
  }
}
