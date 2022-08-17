class AuthResponse {
  String? accessToken;
  String? refreshToken;
  String? id;
  String? userName;

  AuthResponse({this.accessToken, this.refreshToken, this.id, this.userName});

  factory AuthResponse.fromJson(Map<String, dynamic> json) {
    return AuthResponse(
      userName: json['userName'],
      accessToken: json['access_token'],
      refreshToken: json['refresh_token'],
    );
  }
}
