import 'package:dartz/dartz.dart';
import '../../../../core/errors/failure.dart';
import '../entities/category.dart';

// date: 8 May 2025
// by: Fouad
// last modified at: 8 May 2025
// description: This file contains the CategoryRepository interface which defines
// the contract for retrieving categories from the application.
abstract class CategoryRepository {
  Future<Either<Failure, List<Category>>> getCategories();
}
