import '../../domain/entities/category.dart';

class CategoryModel extends Category {
  const CategoryModel({required super.name});

  factory CategoryModel.fromJson(String name) {
    return CategoryModel(name: name);
  }
}
