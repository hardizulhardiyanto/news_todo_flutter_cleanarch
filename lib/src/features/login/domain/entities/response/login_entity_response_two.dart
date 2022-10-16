class LoginEntityResponseTwo {
  LoginEntityResponseTwo({
    this.user,
    this.token,
  });

  UserEntity? user;
  String? token;
}

class UserEntity {
  UserEntity({
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
