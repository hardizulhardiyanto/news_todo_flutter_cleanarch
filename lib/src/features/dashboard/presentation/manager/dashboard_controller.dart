import 'package:get/get.dart';
import 'package:todo_app/src/core/response_classify.dart';
import 'package:todo_app/src/features/dashboard/data/models/request/dashboard_all_task_model_request.dart';
import 'package:todo_app/src/features/dashboard/domain/entities/response/dashboard_alltask_entity_response.dart';
import 'package:todo_app/src/features/dashboard/domain/use_cases/get_dashboard_usecase.dart';

class DashboardController extends GetxController {
  final GetDashboardUseCases getDashboardUseCases;

  DashboardController ({ required this.getDashboardUseCases});
  ResponseClassify<DashboardAllTaskEntityResponse> _resultData = ResponseClassify.initials();
  ResponseClassify<DashboardAllTaskEntityResponse> get resultData => _resultData;

  Future<void> getDashboardAllTask(DashboardAllTaskModelRequest request) async {
    _resultData = ResponseClassify.loading();
    update();
    try {
      _resultData = ResponseClassify.completed( await getDashboardUseCases.call(request));
    } catch (e) {
      _resultData = ResponseClassify.error(e.toString());
    }
    update();
  }

}