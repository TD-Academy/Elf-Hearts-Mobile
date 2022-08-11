// My data body for Sign up
// Nest deer avj uzhiin bol model gesen ug

class SignUpBody {
  String firstName;
  String lastName;
  String userName;
  String email;
  String phoneNumber;
  String password;
  SignUpBody(
      {required this.firstName,
      required this.lastName,
      required this.userName,
      required this.email,
      required this.phoneNumber,
      required this.password});

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data["firstName"] = firstName;
    data["lastName"] = lastName;
    data["userName"] = userName;
    data['email'] = email;
    data["phone"] = phoneNumber;
    data['password'] = password;
    return data;
  }
}
