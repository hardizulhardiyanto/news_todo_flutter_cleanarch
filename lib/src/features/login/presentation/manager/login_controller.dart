import 'package:get/get.dart';
import 'package:todo_app/src/core/response_classify.dart';
import 'package:todo_app/src/features/login/data/models/request/login_model_request.dart';
import 'package:todo_app/src/features/login/domain/entities/response/login_entity_response.dart';
import 'package:todo_app/src/features/login/domain/use_case/get_login_usecase.dart';

class LoginController extends GetxController {
  final GetLoginUseCases getLoginUseCases;

  LoginController({ required this.getLoginUseCases });

  ResponseClassify<LoginEntityResponse> _loginResult = ResponseClassify.initials();

  ResponseClassify<LoginEntityResponse> get loginResult => _loginResult;

  Future<void> postLogin(LoginModelRequest request) async {
    _loginResult = ResponseClassify.loading();
    update();
    try {
      _loginResult = ResponseClassify.completed( await getLoginUseCases.call(request));
    } catch (e) {
    _loginResult = ResponseClassify.error(e.toString());
    }
    update();
  }

  // @override
  // void onInit() async {
  //   super.onInit();
  // }
}