import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';

import '../../features/categories/data/datasources/category_remote_data_source.dart';
import '../../features/categories/data/repositories/category_repository_impl.dart';
import '../../features/categories/domain/repositories/category_repository.dart';
import '../../features/categories/domain/usecases/get_categories.dart';
import '../../features/categories/presentation/cubit/category_cubit.dart';

final sl = GetIt.instance;

Future<void> setupServiceLocator() async {
  // External
  sl.registerLazySingleton<Dio>(() => Dio());

  // Data sources
  sl.registerLazySingleton<CategoryRemoteDataSource>(
    () => CategoryRemoteDataSourceImpl(dio: sl()),
  );

  // Repositories
  sl.registerLazySingleton<CategoryRepository>(
    () => CategoryRepositoryImpl(remoteDataSource: sl()),
  );

  // Use cases
  sl.registerLazySingleton<GetCategories>(() => GetCategories(sl()));

  // Cubits
  sl.registerFactory(() => CategoryCubit(sl()));
}
