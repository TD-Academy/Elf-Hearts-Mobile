import 'dart:convert';
import 'dart:developer';
import 'package:http/http.dart' as http;
import 'package:users/models/user_model.dart';

const ip = 'http://10.0.2.2:5000';

Future<http.Response?> postData(data, endpoint) async {
  http.Response? response;
  try {
    response = await http.post(Uri.parse(ip + endpoint),
        body: jsonEncode(data.toJson()),
        headers: {'Content-type': 'application/json'});
  } catch (e) {
    log(e.toString());
  }
  return response;
}
