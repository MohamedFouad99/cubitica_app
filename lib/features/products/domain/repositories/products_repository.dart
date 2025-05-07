import 'package:dartz/dartz.dart';
import '../../../../core/errors/failure.dart';
import '../entities/product.dart';

abstract class ProductsRepository {
  Future<Either<Failure, List<Product>>> getProductsByCategory(String category);
}
