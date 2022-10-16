import 'package:todo_app/src/features/login/domain/entities/response/login_entity_response.dart';

class LoginModelResponseUser extends UserEntity {
  LoginModelResponseUser.fromJson(Map<String, dynamic> json) {
    age = json['age']?.toInt();
    id = json['_id']?.toString();
    name = json['name']?.toString();
    email = json['email']?.toString();
    createdAt = json['createdAt']?.toString() as DateTime?;
    updatedAt = json['updatedAt']?.toString() as DateTime?;
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
    user = ((json['user'] != null) ? LoginModelResponseUser.fromJson(json['user']) : null);
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
