class Users {
  String? id;
  String? userName;
  String? password;
  String? firstName;
  String? lastName;
  String? email;
  String? phone;
  String? verifyCode;
  String? newPassword;

  Users(
      {this.userName,
      this.password,
      this.id,
      this.firstName,
      this.lastName,
      this.email,
      this.phone,
      this.verifyCode,
      this.newPassword});

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    (id != null) ? data["id"] = id : null;
    data["userName"] = userName;
    data["password"] = password;
    (firstName != null) ? data["firstName"] = firstName : null;
    (lastName != null) ? data["lastName"] = lastName : null;
    (email != null) ? data["email"] = email : null;
    (phone != null) ? data["phone"] = phone : null;
    (verifyCode != null) ? data["verifyCode"] = verifyCode : null;
    (newPassword != null) ? data["newPassword"] = newPassword : null;

    return data;
  }
}
