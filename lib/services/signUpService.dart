import 'dart:convert';
import 'dart:developer';
import 'dart:io';
import 'package:http/http.dart' as http;
import 'package:users/models/signUpModel.dart';

// Nest iin service file tai tustei, functionality bolon logic end bichne
// Ene file deer backend teigee haritsaj bga

// Ene endpoint ni minii uuriin hiisen endpoint
// Backend bagiihnii hiisen endpoint iig hiij uzeh heregtei, mun shaltgaalaad uguh data giin body uurchlugduj magad
const String apiEndpoint = "http://10.0.2.2:5000/signUp";

Future<http.Response?> register(SignUpBody data) async {
  http.Response? response;
  try {
    response = await http.post(Uri.parse(apiEndpoint),
        body: jsonEncode(data.toJson()),
        headers: {
          'Content-type': 'application/json'
        });
  } catch (e) {
    log(e.toString());
  }
  return response;
}
