import 'package:todo_app/src/features/login/data/models/request/login_model_request.dart';
import 'package:todo_app/src/features/login/domain/entities/response/login_entity_response.dart';

abstract class GetLoginDomainRepo {
  Future<LoginEntityResponse> postLogin(LoginModelRequest request);
}