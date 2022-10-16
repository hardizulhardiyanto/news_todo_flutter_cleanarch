import 'package:todo_app/src/core/usecase.dart';
import 'package:todo_app/src/features/dashboard/data/models/request/dashboard_all_task_model_request.dart';
import 'package:todo_app/src/features/dashboard/domain/entities/response/dashboard_alltask_entity_response.dart';
import 'package:todo_app/src/features/dashboard/domain/repositories/get_dashboard_domain_repo.dart';

class GetDashboardUseCases extends UseCase<DashboardAllTaskEntityResponse, DashboardAllTaskModelRequest> {
  final GetDashboardDomainRepo getDashboardDomainRepo;

  GetDashboardUseCases(this.getDashboardDomainRepo);

  @override
  Future<DashboardAllTaskEntityResponse> call(DashboardAllTaskModelRequest params) async {
    return await getDashboardDomainRepo.getDashboardAllTask(params);
  }
}