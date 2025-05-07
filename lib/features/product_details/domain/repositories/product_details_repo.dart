import 'package:dartz/dartz.dart';
import '../../../../core/errors/failure.dart';
import '../entities/product_details.dart';

abstract class ProductDetailsRepo {
  Future<Either<Failure, ProductDetails>> fetchProductDetails(int id);
}
