import 'package:dartz/dartz.dart';
import '../../../../core/errors/failure.dart';
import '../entities/product.dart';
import '../repositories/products_repository.dart';

class GetProductsByCategory {
  final ProductsRepository repository;

  GetProductsByCategory(this.repository);

  Future<Either<Failure, List<Product>>> call(String category) {
    return repository.getProductsByCategory(category);
  }
}
