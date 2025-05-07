import 'package:equatable/equatable.dart';
import '../../domain/entities/product_details.dart';

// Base class for product details states
abstract class ProductDetailsState extends Equatable {
  @override
  List<Object?> get props => [];
}

class ProductDetailsInitial extends ProductDetailsState {}

class ProductDetailsLoading extends ProductDetailsState {}

class ProductDetailsLoaded extends ProductDetailsState {
  final ProductDetails productDetails;

  ProductDetailsLoaded(this.productDetails);

  @override
  List<Object?> get props => [productDetails];
}

class ProductDetailsError extends ProductDetailsState {
  final String message;

  ProductDetailsError(this.message);

  @override
  List<Object?> get props => [message];
}
