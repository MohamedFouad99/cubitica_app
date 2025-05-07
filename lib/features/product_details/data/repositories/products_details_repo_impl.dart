import 'package:dartz/dartz.dart';
import '../../../../core/errors/failure.dart';
import '../../domain/entities/product_details.dart';
import '../../domain/repositories/product_details_repo.dart';
import '../data_sources/product_details_remote_data_source.dart';

class ProductDetailsRepoImpl implements ProductDetailsRepo {
  final ProductDetailsRemoteDataSource remoteDataSource;

  ProductDetailsRepoImpl(this.remoteDataSource);

  @override
  Future<Either<Failure, ProductDetails>> fetchProductDetails(int id) async {
    try {
      final product = await remoteDataSource.fetchProductDetails(id);
      return right(product);
    } catch (e) {
      return left(ServerFailure('Error fetching product details'));
    }
  }
}
