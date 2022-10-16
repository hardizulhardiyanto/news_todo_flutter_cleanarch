import 'package:todo_app/src/core/connection_info.dart';
import 'package:todo_app/src/features/dashboard/data/data_source/get_dashboard_local_data_source.dart';
import 'package:todo_app/src/features/dashboard/data/data_source/get_dashboard_remote_data_source.dart';
import 'package:todo_app/src/features/dashboard/data/models/request/dashboard_all_task_model_request.dart';
import 'package:todo_app/src/features/dashboard/data/models/response/dashboard_alltask_model_response.dart';
import 'package:todo_app/src/features/dashboard/domain/repositories/get_dashboard_domain_repo.dart';
import 'package:todo_app/src/features/login/data/models/response/login_model_response.dart';
import 'package:todo_app/src/features/login/domain/entities/response/login_entity_response.dart';

import '../../../login/data/data_source/get_login_local_data_source.dart';

class GetDashboardDataRepoImpl implements GetDashboardDomainRepo {
  final GetDashboardLocalDataSource getDashboardLocalDataSource;
  final GetDashboardRemoteDataSource getDashboardRemoteDataSource;
  final GetLoginLocalDataSource getLoginLocalDataSource;
  final ConnectionInfo connectionInfo;

  GetDashboardDataRepoImpl(
      this.getDashboardRemoteDataSource,
      this.getDashboardLocalDataSource,
      this.connectionInfo,
      this.getLoginLocalDataSource
      );

  @override
  Future<DashboardAllTaskModelResponse> getDashboardAllTask(DashboardAllTaskModelRequest request) async{
    if (await connectionInfo.isConnected){
      final resultGetAllTask = await getDashboardRemoteDataSource.getAllTask(request);
      getDashboardLocalDataSource.cachedDashboardAllTask(resultGetAllTask);
      return resultGetAllTask;
    } else {
      return await getDashboardLocalDataSource.getDashboardAllTask();
    }
  }

  @override
  Future<LoginModelResponse> getLoginResult() async{
    return await getLoginLocalDataSource.getCachedLogin();
  }

}