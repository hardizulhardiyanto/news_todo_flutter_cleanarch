import 'package:todo_app/src/core/api_todolist.dart';
import 'package:todo_app/src/features/dashboard/data/models/request/dashboard_all_task_model_request.dart';
import 'package:todo_app/src/features/dashboard/data/models/response/dashboard_alltask_model_response.dart';

abstract class GetDashboardRemoteDataSource {
  Future<DashboardAllTaskModelResponse> getAllTask(DashboardAllTaskModelRequest request);
}

class GetDashboardRemoteDataSourceImpl implements GetDashboardRemoteDataSource {
  final ApiTodoList apiTodoList;

  GetDashboardRemoteDataSourceImpl({ required this.apiTodoList});

  @override
  Future<DashboardAllTaskModelResponse> getAllTask(DashboardAllTaskModelRequest request) async {
    final Map<String, dynamic> jsonResponse =
        await apiTodoList.get(
            "/task",
            queryParameters: request.toJson()
        );
    final data = DashboardAllTaskModelResponse.fromJson(jsonResponse);
    return data;
  }

}