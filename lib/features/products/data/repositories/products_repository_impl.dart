import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';

import '../../../../core/errors/failure.dart';
import '../../domain/entities/product.dart';
import '../../domain/repositories/products_repository.dart';
import '../datasources/products_remote_data_source.dart';

// date: 8 May 2025
// by: Fouad
// last modified at: 9 May 2025
// description: This file contains the ProductsRepositoryImpl class which implements
// the ProductsRepository interface.
class ProductsRepositoryImpl implements ProductsRepository {
  final ProductsRemoteDataSource remoteDataSource;

  ProductsRepositoryImpl(this.remoteDataSource);

  @override
  /// Retrieves the list of products by category from the application.
  ///
  /// The method takes a [String] parameter which represents the category
  /// name. The method returns a [Future] that resolves to an [Either] containing
  /// a [List] of [Product] or a [Failure] if the request fails.
  Future<Either<Failure, List<Product>>> getProductsByCategory(
    String category,
  ) async {
    try {
      final result = await remoteDataSource.getProductsByCategory(category);
      return Right(result);
    } catch (e) {
      if (e is DioException) {
        return Left(ServerFailure.fromDiorError(e));
      } else {
        return Left(ServerFailure('Unexpected error'));
      }
    }
  }
}
