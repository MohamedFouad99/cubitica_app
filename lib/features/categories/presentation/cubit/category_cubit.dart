import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:dartz/dartz.dart';

import '../../../../core/errors/failure.dart';
import '../../domain/entities/category.dart';
import '../../domain/usecases/get_categories.dart';
import 'category_state.dart';

// date: 8 May 2025
// by: Fouad
// last modified at: 8 May 2025
// description: This file contains the CategoryCubit class which represents a Cubit for managing the state of categories in the application.
class CategoryCubit extends Cubit<CategoryState> {
  final GetCategories getCategoriesUseCase;

  CategoryCubit(this.getCategoriesUseCase) : super(CategoryInitial());

  /// Fetches the list of categories and updates the state accordingly.
  ///
  /// Emits [CategoryLoading] at the start of the process.
  /// On success, emits [CategoryLoaded] with the list of categories.
  /// On failure, emits [CategoryFailure] with the error details.
  /// Utilizes the [getCategoriesUseCase] to retrieve the categories.

  Future<void> fetchCategories() async {
    emit(CategoryLoading());

    final Either<Failure, List<Category>> result = await getCategoriesUseCase();

    result.fold(
      (failure) => emit(CategoryFailure(failure)),
      (categories) => emit(CategoryLoaded(categories)),
    );
  }
}
