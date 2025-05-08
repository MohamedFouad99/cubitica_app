import 'package:cubitica_app/features/product_details/domain/usecases/fetch_product_details_usecase.dart';
import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';

import '../../features/categories/data/datasources/category_remote_data_source.dart';
import '../../features/categories/data/repositories/category_repository_impl.dart';
import '../../features/categories/domain/repositories/category_repository.dart';
import '../../features/categories/domain/usecases/get_categories.dart';
import '../../features/categories/presentation/cubit/category_cubit.dart';
import '../../features/product_details/data/data_sources/product_details_remote_data_source.dart';
import '../../features/product_details/data/repositories/products_details_repo_impl.dart';
import '../../features/product_details/domain/repositories/product_details_repo.dart';
import '../../features/product_details/presentation/cubit/product_details_cubit.dart';
import '../../features/products/data/datasources/products_remote_data_source.dart';
import '../../features/products/data/repositories/products_repository_impl.dart';
import '../../features/products/domain/repositories/products_repository.dart';
import '../../features/products/domain/usecases/get_products_by_category.dart';
import '../../features/products/presentation/cubit/products_cubit.dart';

// date: 8 May 2025
// by: Fouad
// last modified at: 8 May 2025
// description: This file contains the service locator used in the application.
final getIt = GetIt.instance;

Future<void> setupServiceLocator() async {
  // External
  getIt.registerLazySingleton<Dio>(() => Dio());

  // Data sources
  getIt.registerLazySingleton<CategoryRemoteDataSource>(
    () => CategoryRemoteDataSourceImpl(dio: getIt()),
  );

  // Repositories
  getIt.registerLazySingleton<CategoryRepository>(
    () => CategoryRepositoryImpl(remoteDataSource: getIt()),
  );

  // Use cases
  getIt.registerLazySingleton<GetCategories>(() => GetCategories(getIt()));

  // Cubits
  getIt.registerFactory(() => CategoryCubit(getIt()));
  ///////////////////////////////////////////////////////////////////
  ///PRODUCTS
  // Data Sources
  getIt.registerLazySingleton<ProductsRemoteDataSource>(
    () => ProductsRemoteDataSourceImpl(getIt()),
  );

  // Repositories
  getIt.registerLazySingleton<ProductsRepository>(
    () => ProductsRepositoryImpl(getIt()),
  );

  // Use Cases
  getIt.registerLazySingleton<GetProductsByCategory>(
    () => GetProductsByCategory(getIt()),
  );

  // Cubits
  getIt.registerFactory<ProductsCubit>(() => ProductsCubit(getIt()));
  /////////////////////////////////////////////////////
  // Product Details Data Sources
  getIt.registerLazySingleton<ProductDetailsRemoteDataSource>(
    () => ProductDetailsRemoteDataSourceImpl(getIt()),
  );

  // Product Details Repositories
  getIt.registerLazySingleton<ProductDetailsRepo>(
    () => ProductDetailsRepoImpl(getIt()),
  );

  // Product Details Use Cases
  getIt.registerLazySingleton<FetchProductDetailsUseCase>(
    () => FetchProductDetailsUseCase(getIt()),
  );

  // Product Details Cubit
  getIt.registerFactory<ProductDetailsCubit>(
    () => ProductDetailsCubit(getIt()),
  );
}
