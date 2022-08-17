class Users {
  String? id;
  String? userName;
  String? password;
  String? firstName;
  String? lastName;
  String? email;
  String? phone;

  Users({
    this.userName,
    this.password,
    this.id,
    this.firstName,
    this.lastName,
    this.email,
    this.phone,
  });

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data["userName"] = userName;
    data["password"] = password;
    (firstName != null) ? data["firstName"] = firstName : null;
    (lastName != null) ? data["lastName"] = lastName : null;
    (email != null) ? data["email"] = email : null;
    (phone != null) ? data["phone"] = phone : null;

    return data;
  }
}
