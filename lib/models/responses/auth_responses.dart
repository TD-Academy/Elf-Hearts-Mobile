class AuthResponse {
  String? accessToken;
  String? refreshToken;
  String? id;
  String? userName;
  String? email;

  AuthResponse(
      {this.accessToken,
      this.refreshToken,
      this.id,
      this.userName,
      this.email});

  factory AuthResponse.fromJson(Map<String, dynamic> json) {
    return AuthResponse(
      id: json['id'],
      userName: json['userName'],
      email: json['email'],
      accessToken: json['access_token'],
      refreshToken: json['refresh_token'],
    );
  }
}
