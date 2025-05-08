import '../../domain/entities/product.dart';

// date: 8 May 2025
// by: Fouad
// last modified at: 9 May 2025
// description: This file contains the ProductModel class which represents
// a product in the application.
class ProductModel extends Product {
  ProductModel({
    required super.id,
    required super.title,
    required super.thumbnail,
    required super.price,
  });

  factory ProductModel.fromJson(Map<String, dynamic> json) {
    return ProductModel(
      id: json['id'],
      title: json['title'],
      thumbnail: json['thumbnail'],
      price: json['price'],
    );
  }
}
