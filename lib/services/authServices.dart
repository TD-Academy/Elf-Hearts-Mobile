import 'dart:convert';
import 'dart:developer';
import 'package:http/http.dart' as http;
import 'package:users/models/authModels.dart';

const String signInEndpoint = "http://10.0.2.2:5000/signIn";
const String signUpEndpoint = "http://10.0.2.2:5000/signUp";

Future<http.Response?> signIn(SignInBody data) async {
  http.Response? response;
  try {
    response = await http.post(Uri.parse(signInEndpoint),
        body: jsonEncode(data.toJson()),
        headers: {
          'Content-type': 'application/json',
          'Access-Control-Allow-Origin': '*',
        });
  } catch (e) {
    log(e.toString());
  }
  return response;
}

Future<http.Response?> register(SignUpBody data) async {
  http.Response? response;
  try {
    response = await http.post(Uri.parse(signUpEndpoint),
        body: jsonEncode(data.toJson()),
        headers: {'Content-type': 'application/json'});
  } catch (e) {
    log(e.toString());
  }
  return response;
}
