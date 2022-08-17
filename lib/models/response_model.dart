import 'dart:convert';

class SignInResponse {
  final resp;
  String? userName;
  String? userId;
  String? accessToken;
  String? refreshToken;

  SignInResponse({
    required this.resp,
  });

  toJson() {
    final respBody = jsonDecode(resp);
    userName = respBody['user']['userName'];
    userId = respBody['user']['userId'];
    accessToken = respBody['access_token'];
    refreshToken = respBody['refresh_token'];
  }
}
