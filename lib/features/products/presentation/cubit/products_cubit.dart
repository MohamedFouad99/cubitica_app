import 'package:flutter_bloc/flutter_bloc.dart';
import '../../domain/usecases/get_products_by_category.dart';
import 'products_state.dart';

// date: 8 May 2025
// by: Fouad
// last modified at: 9 May 2025
// description: This file contains the ProductsCubit class which is used to manage the state of the products screen.
class ProductsCubit extends Cubit<ProductsState> {
  final GetProductsByCategory getProductsByCategory;

  ProductsCubit(this.getProductsByCategory) : super(ProductsInitial());

  /// Retrieves the list of products by category from the application.
  ///
  /// The method takes a [String] parameter which represents the category
  /// name. The method emits a [ProductsLoading] state, then emits a
  /// [ProductsLoaded] state with the list of products if the request is
  /// successful, or a [ProductsError] state with the error message if the
  /// request fails.
  void fetchProducts(String category) async {
    emit(ProductsLoading());
    final result = await getProductsByCategory(category);
    result.fold(
      (failure) => emit(ProductsError(failure.message)),
      (products) => emit(ProductsLoaded(products)),
    );
  }
}
