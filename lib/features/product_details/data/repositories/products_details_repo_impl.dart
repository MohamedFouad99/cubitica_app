import 'package:dartz/dartz.dart';
import '../../../../core/errors/failure.dart';
import '../../domain/entities/product_details.dart';
import '../../domain/repositories/product_details_repo.dart';
import '../data_sources/product_details_remote_data_source.dart';

// date: 8 May 2025
// by: Fouad
// last modified at: 9 May 2025
// description: This file contains the ProductDetailsRepoImpl class which
// implements the ProductDetailsRepo interface.
class ProductDetailsRepoImpl implements ProductDetailsRepo {
  final ProductDetailsRemoteDataSource remoteDataSource;

  ProductDetailsRepoImpl(this.remoteDataSource);

  @override
  /// Retrieves the product details by [id] from the application.
  ///
  /// The method takes an [int] parameter which represents the product
  /// id. The method returns a [Future] that resolves to an [Either] containing
  /// a [ProductDetails] or a [Failure] if the request fails.
  Future<Either<Failure, ProductDetails>> fetchProductDetails(int id) async {
    try {
      final product = await remoteDataSource.fetchProductDetails(id);
      return right(product);
    } catch (e) {
      return left(ServerFailure('Error fetching product details'));
    }
  }
}
