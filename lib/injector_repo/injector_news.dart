
import 'package:get_it/get_it.dart';
import 'package:todo_app/src/core/api_provider.dart';
import 'package:todo_app/src/features/news/data/data_source/get_news_local_data_source.dart';
import 'package:todo_app/src/features/news/data/data_source/get_news_remote_data_source.dart';

import '../src/features/news/data/repositories/get_news_repo_impl.dart';
import '../src/features/news/domain/repositories/get_news_repo.dart';
import '../src/features/news/domain/use_cases/get_news_usecase.dart';

Future<void> injectorNews() async {
  final sl = GetIt.instance;

  // Use cases
  sl.registerLazySingleton(() => GetNewsUseCases(sl()));

  // Repository
  sl.registerLazySingleton<GetNewsRepository>(
        () => GetNewsRepositoryImpl(sl(), sl(), sl()),
  );

  // Data sources
  sl.registerLazySingleton<GetNewsRemoteDataSource>(
        () => GetNewsRemoteDataSourceImpl(apiProvider: sl()),
  );
  sl.registerLazySingleton<GetNewsLocalDataSource>(
        () => GetNewsLocalDataSourceImpl(localStorage: sl()),
  );

  //! Core
  sl.registerLazySingleton<ApiProvider>(
        () => ApiProvider(),
  );
}