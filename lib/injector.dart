import 'package:get_it/get_it.dart';
import 'package:get_storage/get_storage.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';
import 'package:todo_app/injector_repo/injector_dashboard.dart';
import 'package:todo_app/src/core/api_provider.dart';
import 'package:todo_app/src/core/api_todolist.dart';
import 'package:todo_app/src/core/connection_info.dart';
import 'injector_repo/injector_login.dart';
import 'injector_repo/injector_news.dart';


final sl = GetIt.instance;

Future<void> init() async {
  injectorLogin();
  injectorNews();
  injectorDashboard();

  await GetStorage.init();
  sl.registerLazySingleton<ConnectionInfo>(() => ConnectionInfoImpl(sl()));
  sl.registerLazySingleton(() => InternetConnectionChecker());
  sl.registerLazySingleton(() => GetStorage());
  //Core
  sl.registerLazySingleton<ApiTodoList>(() => ApiTodoList());
  sl.registerLazySingleton<ApiProvider>(() => ApiProvider(),
  );
}
