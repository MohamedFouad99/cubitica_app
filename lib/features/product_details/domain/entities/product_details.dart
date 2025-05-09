// date: 8 May 2025
// by: Fouad
// last modified at: 9 May 2025
// description: This file contains the ProductDetails class
// which represents the product details Entity in the application.
class ProductDetails {
  final int id;
  final String title;
  final String description;
  final double price;
  final List<String> images;
  final double rating;
  final int stock;
  final String sku;
  final String brand;
  final String category;
  final List<String> tags;
  final List<Review> reviews;

  ProductDetails({
    required this.id,
    required this.title,
    required this.description,
    required this.price,
    required this.images,
    required this.rating,
    required this.stock,
    required this.sku,
    required this.brand,
    required this.category,
    required this.tags,
    required this.reviews,
  });
}

class Review {
  final String username;
  final String comment;
  final double rating;

  Review({required this.username, required this.comment, required this.rating});
  factory Review.fromJson(Map<String, dynamic> json) {
    return Review(
      username: json['reviewerName'],
      comment: json['comment'],
      rating: (json['rating'] as num).toDouble(),
    );
  }
}
