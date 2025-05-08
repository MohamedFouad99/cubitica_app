import '../../domain/entities/product_details.dart';

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
      stock: json['stock'],
      rating: json['rating'],
      brand: json['brand'],
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
