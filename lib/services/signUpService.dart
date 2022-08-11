import 'dart:convert';
import 'dart:developer';
import 'package:http/http.dart' as http;
import 'package:users/models/signUpModel.dart';

// Nest iin service file tai tustei, functionality bolon logic end bichne
// Ene file deer backend teigee haritsaj bga

// Ene endpoint ni minii uuriin hiisen endpoint
// Backend bagiihnii hiisen endpoint iig hiij uzeh heregtei, mun shaltgaalaad uguh data giin body uurchlugduj magad
const String apiEndpoint = "http://localhost:3000/user/create";

Future<http.Response?> register(SignUpBody data) async {
  http.Response? response;
  try {
    response = await http.post(Uri.parse(apiEndpoint),
        body: jsonEncode(data.toJson()));
  } catch (e) {
    log(e.toString());
  }
  return response;
}
