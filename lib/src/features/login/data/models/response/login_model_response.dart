import '../../../domain/entities/response/login_entity_response.dart';

// To parse this JSON data, do
//
//     final loginModelResponseUser = loginModelResponseUserFromJson(jsonString);

import 'dart:convert';

LoginModelResponse loginModelResponseUserFromJson(String str) => LoginModelResponse.fromJson(json.decode(str));

String loginModelResponseUserToJson(LoginModelResponse data) => json.encode(data.toJson());

class LoginModelResponse extends LoginEntityResponse {
  LoginModelResponse.fromJson(Map<String, dynamic> json){
    user = json["user"] == null ? null : User.fromJson(json["user"]);
    token = json["token"];
  }
  Map<String, dynamic> toJson() => {
    "user": user == null ? null : ( user as User).toJson(),
    "token": token,
  };
}

class User extends UserEntity {
  User.fromJson(Map<String, dynamic> json){
    age = json["age"];
    id = json["_id"];
    name = json["name"];
    email = json["email"];
    createdAt = json["createdAt"] == null ? null : DateTime.parse(json["createdAt"]);
    updatedAt = json["updatedAt"] == null ? null : DateTime.parse(json["updatedAt"]);
    idKey = json["__v"];
  }

  Map<String, dynamic> toJson() => {
    "age": age == null ? null : age,
    "_id": id == null ? null : id,
    "name": name == null ? null : name,
    "email": email == null ? null : email,
    "createdAt": createdAt == null ? null : createdAt?.toIso8601String(),
    "updatedAt": updatedAt == null ? null : updatedAt?.toIso8601String(),
    "__v": idKey == null ? null : idKey,
  };
}
