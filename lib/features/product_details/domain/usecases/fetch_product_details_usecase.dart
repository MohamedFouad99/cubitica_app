import 'package:dartz/dartz.dart';

import '../../../../core/errors/failure.dart';
import '../entities/product_details.dart';
import '../repositories/product_details_repo.dart';

// date: 8 May 2025
// by: Fouad
// last modified at: 9 May 2025
// description: This file contains the FetchProductDetailsUseCase class which
// represents a use case for fetching product details from the application.
class FetchProductDetailsUseCase {
  final ProductDetailsRepo repo;

  FetchProductDetailsUseCase(this.repo);

  /// Retrieves the product details by [id] from the application.
  ///
  /// The method takes an [int] parameter which represents the product
  /// id. The method returns a [Future] that resolves to an [Either] containing
  /// a [ProductDetails] or a [Failure] if the request fails.
  Future<Either<Failure, ProductDetails>> call(int id) {
    return repo.fetchProductDetails(id);
  }
}
