import 'package:dartz/dartz.dart';
import '../../../../core/errors/failure.dart';
import '../entities/product_details.dart';
import '../repositories/product_details_repo.dart';

class FetchProductDetailsUseCase {
  final ProductDetailsRepo repo;

  FetchProductDetailsUseCase(this.repo);

  Future<Either<Failure, ProductDetails>> call(int id) {
    return repo.fetchProductDetails(id);
  }
}
