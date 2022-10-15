import 'package:todo_app/src/features/login/domain/entities/request/login_entity_request.dart';

class LoginModelRequest extends LoginEntityRequest{
  String? email;
  String? password;

  LoginModelRequest({
    this.email,
    this.password,
  });
  LoginModelRequest.fromJson(Map<String, dynamic> json) {
    email = json['email']?.toString();
    password = json['password']?.toString();
  }
  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['email'] = email;
    data['password'] = password;
    return data;
  }
}
