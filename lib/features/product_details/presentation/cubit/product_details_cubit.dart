import '../../domain/usecases/fetch_product_details_usecase.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'product_details_state.dart';

// date: 8 May 2025
// by: Fouad
// last modified at: 9 May 2025
// description: This file contains the ProductDetailsCubit class which is
// used to manage the state of the product details screen.
class ProductDetailsCubit extends Cubit<ProductDetailsState> {
  final FetchProductDetailsUseCase fetchProductDetailsUseCase;

  ProductDetailsCubit(this.fetchProductDetailsUseCase)
    : super(ProductDetailsInitial());

  /// Retrieves the product details by [id] from the API.
  ///
  /// The method takes an [int] parameter which represents the product
  /// id. The method returns a [Future] that resolves to a
  /// [ProductDetailsState] which can be any of the following:
  ///
  /// - [ProductDetailsLoading] if the request is in progress.
  /// - [ProductDetailsLoaded] if the request is successful and the
  ///   product details are loaded.
  /// - [ProductDetailsError] if the request fails and an error message
  ///   is available.
  Future<void> getProductDetails(int id) async {
    emit(ProductDetailsLoading());

    final result = await fetchProductDetailsUseCase(id);

    result.fold(
      (failure) => emit(ProductDetailsError(failure.message)),
      (productDetails) => emit(ProductDetailsLoaded(productDetails)),
    );
  }
}
