// date: 8 May 2025
// by: Fouad
// last modified at: 9 May 2025
// description: This file contains the Product class which represents a product Entity in the application.
class Product {
  final int id;
  final String title;
  final String thumbnail;
  final num price;

  Product({
    required this.id,
    required this.title,
    required this.thumbnail,
    required this.price,
  });
}
