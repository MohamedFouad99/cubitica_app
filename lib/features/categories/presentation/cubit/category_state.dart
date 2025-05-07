import 'package:equatable/equatable.dart';
import '../../../../core/errors/failure.dart';
import '../../domain/entities/category.dart';

abstract class CategoryState extends Equatable {
  const CategoryState();

  @override
  List<Object?> get props => [];
}

class CategoryInitial extends CategoryState {}

class CategoryLoading extends CategoryState {}

class CategoryLoaded extends CategoryState {
  final List<Category> categories;

  const CategoryLoaded(this.categories);

  @override
  List<Object?> get props => [categories];
}

class CategoryFailure extends CategoryState {
  final Failure failure;

  const CategoryFailure(this.failure);

  @override
  List<Object?> get props => [failure];
}
