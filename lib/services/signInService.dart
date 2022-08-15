import 'dart:convert';
import 'dart:developer';
import 'dart:io';
import 'package:http/http.dart' as http;
import 'package:users/models/signInModel.dart';

const String apiEndpoint = "http://10.0.2.2:5000/signIn";

Future<http.Response?> signIn(SignInBody data) async {
  http.Response? response;
  try {
    response = await http.post(Uri.parse(apiEndpoint),
        body: jsonEncode(data.toJson()),
        headers: {
          'Content-type': 'application/json',
          // 'Auth':"Bearer "+ l 
        });
  } catch (e) {
    
    log(e.toString());
  }
  return response;
}
