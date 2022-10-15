class LoginEntityResponse {
  LoginEntityResponse({
    this.user,
    this.token,
  });

  User? user;
  String? token;
}

class User {
  User({
    this.age,
    this.id,
    this.name,
    this.email,
    this.createdAt,
    this.updatedAt,
    this.idKey,
  });

  int? age;
  String? id;
  String? name;
  String? email;
  DateTime? createdAt;
  DateTime? updatedAt;
  int? idKey;
}
