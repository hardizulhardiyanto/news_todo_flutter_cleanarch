import 'package:get_storage/get_storage.dart';
import 'package:todo_app/src/features/dashboard/data/models/response/dashboard_alltask_model_response.dart';

abstract class GetDashboardLocalDataSource {
  Future<DashboardAllTaskModelResponse> getDashboardAllTask();

  Future<void> cachedDashboardAllTask(DashboardAllTaskModelResponse cachedDashboardAllTask);
}

class GetDashboardLocalDataSourceImpl implements GetDashboardLocalDataSource {
  final GetStorage localStorage;

  GetDashboardLocalDataSourceImpl({ required this.localStorage});

  @override
  Future<void> cachedDashboardAllTask(DashboardAllTaskModelResponse cachedDashboardAllTask) {
    return localStorage.write("dashboardAllTask", cachedDashboardAllTask.toJson());
  }

  @override
  Future<DashboardAllTaskModelResponse> getDashboardAllTask() {
    final jsonDashboardAllTask = localStorage.read("dashboardAllTask");
    if (jsonDashboardAllTask != null) {
      return Future.value(DashboardAllTaskModelResponse.fromJson(jsonDashboardAllTask));
    } else {
      throw "Cached Error";
    }
  }
}