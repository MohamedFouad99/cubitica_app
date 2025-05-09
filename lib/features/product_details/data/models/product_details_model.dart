import '../../domain/entities/product_details.dart';

// date: 8 May 2025
// by: Fouad
// last modified at: 9 May 2025
// description: This file contains the ProductDetailsModel class which
// represents the product details data model.
class ProductDetailsModel extends ProductDetails {
  ProductDetailsModel({
    required super.id,
    required super.title,
    required super.description,
    required super.images,
    required super.price,
    required super.stock,
    required super.rating,
    required super.brand,
    required super.category,
    required super.sku,
    required super.tags,
    required super.reviews,
  });

  factory ProductDetailsModel.fromJson(Map<String, dynamic> json) {
    return ProductDetailsModel(
      id: json['id'],
      title: json['title'],
      description: json['description'],
      images: List<String>.from(json['images']),
      price: json['price'],
      stock: json['stock'] ?? 0,
      rating: json['rating'] ?? 0,
      brand: json['brand'] ?? 'N/A',
      category: json['category'],
      sku: json['sku'] ?? 'N/A',
      tags: json['tags'] != null ? List<String>.from(json['tags']) : [],
      reviews:
          json['reviews'] != null
              ? (json['reviews'] as List)
                  .map((review) => Review.fromJson(review))
                  .toList()
              : [],
    );
  }
}
