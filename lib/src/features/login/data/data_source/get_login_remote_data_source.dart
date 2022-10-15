import 'dart:convert';

import 'package:todo_app/src/core/api_todolist.dart';
import 'package:todo_app/src/features/login/data/models/request/login_model_request.dart';
import 'package:todo_app/src/features/login/data/models/response/login_model_response.dart';

abstract class GetLoginRemoteDataSource {
  Future<LoginModelResponse> postLogin(LoginModelRequest request);
}

class GetLoginRemoteDataSourceImpl implements GetLoginRemoteDataSource{
  final ApiTodoList apiTodoList;

  GetLoginRemoteDataSourceImpl({ required this.apiTodoList });

  @override
  Future<LoginModelResponse> postLogin(LoginModelRequest request) async {
    String jsonBodyRequest = jsonEncode(request);
    final Map<String, dynamic> jsonResponse = await apiTodoList.post(
          "/login",
          jsonBodyRequest,
          null
    );
    final data = LoginModelResponse.fromJson(jsonResponse);
    return data;
  }
}