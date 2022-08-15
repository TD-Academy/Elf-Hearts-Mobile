// My data body for Sign up
// Nest deer avj uzhiin bol model gesen ug

class SignUpBody {
  String userName;
  String password;
  String firstName;
  String lastName;
  String email;
  String phone;
  SignUpBody(
      {required this.userName,
      required this.password,
      required this.firstName,
      required this.lastName,
      required this.email,
      required this.phone,
      });

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data["userName"] = userName;
    data['password'] = password;
    data["firstName"] = firstName;
    data["lastName"] = lastName;
    data['email'] = email;
    data["phone"] = phone;
    return data;
  }
}