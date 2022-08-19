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
    (userName != null) ? data["userName"] = userName : null;
    data["email"] = email;
    data["password"] = password;
    (firstName != null) ? data["firstName"] = firstName : null;
    (lastName != null) ? data["lastName"] = lastName : null;
    (phone != null) ? data["phone"] = phone : null;
    (verifyCode != null) ? data["verifyCode"] = verifyCode : null;
    (newPassword != null) ? data["newPassword"] = newPassword : null;

    return data;
  }
}
