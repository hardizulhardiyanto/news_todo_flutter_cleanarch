import 'package:get_it/get_it.dart';
import 'package:todo_app/src/features/login/data/data_source/get_login_local_data_source.dart';
import 'package:todo_app/src/features/login/data/data_source/get_login_remote_data_source.dart';

import '../src/features/login/data/repository/get_login_repo_impl.dart';
import '../src/features/login/domain/repositories/get_login_domain_repo.dart';
import '../src/features/login/domain/use_case/get_login_usecase.dart';

Future<void> injectorLogin() async {
  final sl = GetIt.instance;
  //useCase
  sl.registerLazySingleton(() => GetLoginUseCases(sl()));

  //repository
  sl.registerLazySingleton<GetLoginDomainRepo>(
        () => GetLoginDataRepo(sl(), sl(), sl()),
  );

  //data sources
  sl.registerLazySingleton<GetLoginRemoteDataSource>(
        () => GetLoginRemoteDataSourceImpl(apiTodoList: sl()),
  );
  sl.registerLazySingleton<GetLoginLocalDataSource>(
          () => GetLoginLocalDataSourceImpl(localStorage: sl())
  );
}