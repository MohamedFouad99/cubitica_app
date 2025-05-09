import 'package:equatable/equatable.dart';

import '../../domain/entities/product_details.dart';

// date: 8 May 2025
// by: Fouad
// last modified at: 9 May 2025
// description: This file contains the ProductDetailsState class which is
// used to manage the state of the product details screen.
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
