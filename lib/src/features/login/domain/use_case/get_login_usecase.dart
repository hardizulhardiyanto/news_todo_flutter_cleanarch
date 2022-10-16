import 'package:todo_app/src/core/usecase.dart';
import 'package:todo_app/src/features/login/data/models/request/login_model_request.dart';
import 'package:todo_app/src/features/login/domain/entities/response/login_entity_response.dart';
import 'package:todo_app/src/features/login/domain/entities/response/login_entity_response_two.dart';
import 'package:todo_app/src/features/login/domain/repositories/get_login_domain_repo.dart';

class GetLoginUseCases extends UseCase<LoginEntityResponse, LoginModelRequest> {
  final GetLoginDomainRepo getLoginDomainRepo;

  GetLoginUseCases(this.getLoginDomainRepo);

  @override
  Future<LoginEntityResponse> call(LoginModelRequest params) async {
    return await getLoginDomainRepo.postLogin(params);
  }

}