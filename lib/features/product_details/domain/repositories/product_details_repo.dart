import 'package:dartz/dartz.dart';

import '../../../../core/errors/failure.dart';
import '../entities/product_details.dart';

// date: 8 May 2025
// by: Fouad
// last modified at: 9 May 2025
// description: This file contains the ProductDetailsRepo interface
// which defines the contract for retrieving product details from the application.
abstract class ProductDetailsRepo {
  Future<Either<Failure, ProductDetails>> fetchProductDetails(int id);
}
