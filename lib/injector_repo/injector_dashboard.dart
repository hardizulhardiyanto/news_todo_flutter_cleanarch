import 'package:get_it/get_it.dart';
import 'package:todo_app/src/core/api_todolist.dart';
import 'package:todo_app/src/features/dashboard/data/data_source/get_dashboard_local_data_source.dart';
import 'package:todo_app/src/features/dashboard/data/data_source/get_dashboard_remote_data_source.dart';
import 'package:todo_app/src/features/dashboard/data/repository/get_dashboard_data_repo_impl.dart';
import 'package:todo_app/src/features/dashboard/domain/repositories/get_dashboard_domain_repo.dart';
import 'package:todo_app/src/features/dashboard/domain/use_cases/get_dashboard_usecase.dart';

Future<void> injectorDashboard() async {
  final sl = GetIt.instance;
  //UseCases
  sl.registerLazySingleton(() => GetDashboardUseCases(sl()));
  //Repository
  sl.registerLazySingleton<GetDashboardDomainRepo>(() => GetDashboardDataRepoImpl(sl(), sl(), sl()));
  //DataSource
  sl.registerLazySingleton<GetDashboardRemoteDataSource>(() => GetDashboardRemoteDataSourceImpl(apiTodoList: sl()));
  sl.registerLazySingleton<GetDashboardLocalDataSource>(() => GetDashboardLocalDataSourceImpl(localStorage: sl()));
  //Core
  sl.registerLazySingleton<ApiTodoList>(() => ApiTodoList());
}