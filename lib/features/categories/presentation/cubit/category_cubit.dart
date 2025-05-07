import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:dartz/dartz.dart';

import '../../../../core/errors/failure.dart';
import '../../domain/entities/category.dart';
import '../../domain/usecases/get_categories.dart';
import 'category_state.dart';

class CategoryCubit extends Cubit<CategoryState> {
  final GetCategories getCategoriesUseCase;

  CategoryCubit(this.getCategoriesUseCase) : super(CategoryInitial());

  Future<void> fetchCategories() async {
    emit(CategoryLoading());

    final Either<Failure, List<Category>> result = await getCategoriesUseCase();

    result.fold(
      (failure) => emit(CategoryFailure(failure)),
      (categories) => emit(CategoryLoaded(categories)),
    );
  }
}
