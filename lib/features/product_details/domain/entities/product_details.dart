class ProductDetails {
  final int id;
  final String title;
  final String description;
  final List<String> images;
  final num price;
  final int stock;
  final num rating;
  final String brand;
  final String category;
  final String sku;
  final List<String> tags;

  ProductDetails({
    required this.id,
    required this.title,
    required this.description,
    required this.images,
    required this.price,
    required this.stock,
    required this.rating,
    required this.brand,
    required this.category,
    required this.sku,
    required this.tags,
  });
}
