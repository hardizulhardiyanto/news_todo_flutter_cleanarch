import 'package:todo_app/src/core/connection_info.dart';
import 'package:todo_app/src/features/login/data/data_source/get_login_local_data_source.dart';
import 'package:todo_app/src/features/login/data/data_source/get_login_remote_data_source.dart';
import 'package:todo_app/src/features/login/data/models/request/login_model_request.dart';
import 'package:todo_app/src/features/login/domain/entities/response/login_entity_response.dart';
import 'package:todo_app/src/features/login/domain/repositories/get_login_domain_repo.dart';

class GetLoginDataRepo implements GetLoginDomainRepo{
  final GetLoginRemoteDataSource getLoginRemoteDataSource;
  final GetLoginLocalDataSource getLoginLocalDataSource;
  final ConnectionInfo connectionInfo;

  GetLoginDataRepo(
      this.getLoginRemoteDataSource,
      this.getLoginLocalDataSource,
      this.connectionInfo
  );

  @override
  Future<LoginEntityResponse> postLogin(LoginModelRequest request) async {
    if (await connectionInfo.isConnected){
      final remotePostLogin = await getLoginRemoteDataSource.postLogin(request);
      getLoginLocalDataSource.cachedLogin(remotePostLogin);
      return remotePostLogin;
    } else {
      return await getLoginLocalDataSource.getCachedLogin();
    }
  }
}