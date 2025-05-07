class CategoryModel {
  final String name;

  const CategoryModel({required this.name});

  factory CategoryModel.fromJson(String name) {
    return CategoryModel(name: name);
  }
}
