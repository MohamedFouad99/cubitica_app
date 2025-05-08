import 'package:dartz/dartz.dart';
import '../../../../core/errors/failure.dart';
import '../entities/product.dart';

// date: 8 May 2025
// by: Fouad
// last modified at: 9 May 2025
abstract class ProductsRepository {
  /// Retrieves the list of products by category from the application.
  ///
  /// The method takes a [String] parameter which represents the category
  /// name. The method returns a [Future] that resolves to an [Either] containing
  /// a [List] of [Product] or a [Failure] if the request fails.
  Future<Either<Failure, List<Product>>> getProductsByCategory(String category);
}
