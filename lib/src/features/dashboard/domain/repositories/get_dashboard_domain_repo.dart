import 'package:todo_app/src/features/dashboard/data/models/request/dashboard_all_task_model_request.dart';
import 'package:todo_app/src/features/dashboard/data/models/response/dashboard_alltask_model_response.dart';

import '../../../login/data/models/response/login_model_response.dart';

abstract class GetDashboardDomainRepo {
  Future<DashboardAllTaskModelResponse> getDashboardAllTask(DashboardAllTaskModelRequest request);
  Future<LoginModelResponse> getLoginResult();
}