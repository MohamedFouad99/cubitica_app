import '../../domain/entities/category.dart';

// date: 8 May 2025
// by: Fouad
// last modified at: 8 May 2025
// description: This file contains the CategoryModel class which represents a category in the application.
class CategoryModel extends Category {
  const CategoryModel({required super.name});

  factory CategoryModel.fromJson(String name) {
    return CategoryModel(name: name);
  }
}
