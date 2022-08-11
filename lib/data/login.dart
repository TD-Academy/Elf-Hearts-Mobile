import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:users/services/storage_service.dart';

const String apiEndpoint = "http://localhost:3000/user/users";

final Uri url = Uri.parse(apiEndpoint);

var isUser = false;
var responseMessage = '';

// Warning!
// Sign In working gehdee app level dee boloogu bga, state management bolon local storage token ed nariig handle hiih bolomjgu bga
// Currently working on Sign Up

void signIn(name, password) async {
  try {
    var data = await http.get(url);
    var jsonData = jsonDecode(data.body);

    for (var i = 0; i < jsonData.length; i++) {
      if (name == jsonData[i]['userName'] &&
          password == jsonData[i]['password']) {
        isUser = true;
        responseMessage = 'Successfully logged in.';
        await secureStorage.write(key: 'KEY_USERNAME', value: name);
        await secureStorage.write(key: 'KEY_PASSWORD', value: password);
        print(secureStorage.readAll().hashCode);
      } else {
        responseMessage = 'Incorrect username or password!';
      }
    }
    print(responseMessage);
  } catch (e) {
    print(e);
  }
}
