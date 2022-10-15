import 'package:todo_app/src/features/login/domain/entities/response/login_entity_response.dart';

class LoginModelResponseUser {
  int? age;
  String? id;
  String? name;
  String? email;
  String? createdAt;
  String? updatedAt;
  int? idKey;

  LoginModelResponseUser({
    this.age,
    this.id,
    this.name,
    this.email,
    this.createdAt,
    this.updatedAt,
    this.idKey,
  });
  LoginModelResponseUser.fromJson(Map<String, dynamic> json) {
    age = json['age']?.toInt();
    id = json['_id']?.toString();
    name = json['name']?.toString();
    email = json['email']?.toString();
    createdAt = json['createdAt']?.toString();
    updatedAt = json['updatedAt']?.toString();
    idKey = json['__v']?.toInt();
  }
  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['age'] = age;
    data['_id'] = id;
    data['name'] = name;
    data['email'] = email;
    data['createdAt'] = createdAt;
    data['updatedAt'] = updatedAt;
    data['__v'] = idKey;
    return data;
  }
}

class LoginModelResponse extends LoginEntityResponse {

  LoginModelResponse.fromJson(Map<String, dynamic> json) {
    user = (json['user'] != null ? LoginModelResponseUser.fromJson(json['user']) : null) as User?;
    token = json['token']?.toString();
  }
  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    if (user != null) {
      data['user'] = user;
    }
    data['token'] = token;
    return data;
  }
}
