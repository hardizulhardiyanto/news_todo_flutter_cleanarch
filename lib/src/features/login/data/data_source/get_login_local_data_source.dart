
import 'package:get_storage/get_storage.dart';
import 'package:todo_app/src/features/login/data/models/response/login_model_response.dart';

abstract class GetLoginLocalDataSource {
  Future<LoginModelResponse> getCachedLogin();

  Future<void> cachedLogin(LoginModelResponse cachedLogin);
}

class GetLoginLocalDataSourceImpl implements GetLoginLocalDataSource{
  GetLoginLocalDataSourceImpl({ required this.localStorage});

  final GetStorage localStorage;

  @override
  Future<void> cachedLogin(LoginModelResponse cachedLogin) {
    return localStorage.write("login", cachedLogin.toJson());
  }

  @override
  Future<LoginModelResponse> getCachedLogin() {
    final loginJson = localStorage.read("login");
    if (loginJson != null) {
      return Future.value(LoginModelResponse.fromJson(loginJson));
    } else {
      throw "Cached Login Error";
    }
  }
}