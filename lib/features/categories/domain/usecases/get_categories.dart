import 'package:dartz/dartz.dart';
import '../../../../core/errors/failure.dart';
import '../entities/category.dart';
import '../repositories/category_repository.dart';

// date: 8 May 2025
// by: Fouad
// last modified at: 8 May 2025
// description: This file contains the GetCategories class which represents
// a use case for retrieving categories from the application.
class GetCategories {
  final CategoryRepository repository;

  GetCategories(this.repository);

  /// Retrieves the list of categories from the application.
  ///
  /// The method returns a [Future] that resolves to an [Either] containing
  /// a [List] of [Category] or a [Failure] if the request fails.
  Future<Either<Failure, List<Category>>> call() {
    return repository.getCategories();
  }
}
