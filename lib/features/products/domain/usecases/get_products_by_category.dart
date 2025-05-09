import 'package:dartz/dartz.dart';

import '../../../../core/errors/failure.dart';
import '../entities/product.dart';
import '../repositories/products_repository.dart';

// date: 8 May 2025
// by: Fouad
// last modified at: 9 May 2025
class GetProductsByCategory {
  final ProductsRepository repository;

  GetProductsByCategory(this.repository);

  /// Retrieves the list of products by category from the application.
  ///
  /// The method takes a [String] parameter which represents the category
  /// name. The method returns a [Future] that resolves to an [Either] containing
  /// a [List] of [Product] or a [Failure] if the request fails.
  Future<Either<Failure, List<Product>>> call(String category) {
    return repository.getProductsByCategory(category);
  }
}
