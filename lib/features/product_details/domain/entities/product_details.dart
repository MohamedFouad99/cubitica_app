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
  final List<Review> reviews; // Add the reviews list

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
    required this.reviews, // Include reviews in constructor
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
