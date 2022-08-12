// My data body for Sign up
// Nest deer avj uzhiin bol model gesen ug

class SignInBody {
  String userName;
  String password;
  SignInBody(
      {required this.userName,
      required this.password,
      });

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data["userName"] = userName;
    data['password'] = password;
    return data;
  }
}
