import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import '../../../../core/errors/failure.dart';
import '../../domain/entities/product.dart';
import '../../domain/repositories/products_repository.dart';
import '../datasources/products_remote_data_source.dart';

class ProductsRepositoryImpl implements ProductsRepository {
  final ProductsRemoteDataSource remoteDataSource;

  ProductsRepositoryImpl(this.remoteDataSource);

  @override
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
