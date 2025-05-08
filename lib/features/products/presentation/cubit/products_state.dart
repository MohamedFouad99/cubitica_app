import '../../domain/entities/product.dart';

// date: 8 May 2025
// by: Fouad
// last modified at: 9 May 2025
// description: This file contains the ProductsState class which represents
// the state of products in the application.
abstract class ProductsState {}

class ProductsInitial extends ProductsState {}

class ProductsLoading extends ProductsState {}

class ProductsLoaded extends ProductsState {
  final List<Product> products;
  ProductsLoaded(this.products);
}

class ProductsError extends ProductsState {
  final String message;
  ProductsError(this.message);
}
