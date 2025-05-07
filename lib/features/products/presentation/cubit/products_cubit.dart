import 'package:flutter_bloc/flutter_bloc.dart';
import '../../domain/usecases/get_products_by_category.dart';
import 'products_state.dart';

class ProductsCubit extends Cubit<ProductsState> {
  final GetProductsByCategory getProductsByCategory;

  ProductsCubit(this.getProductsByCategory) : super(ProductsInitial());

  void fetchProducts(String category) async {
    emit(ProductsLoading());
    final result = await getProductsByCategory(category);
    result.fold(
      (failure) => emit(ProductsError(failure.message)),
      (products) => emit(ProductsLoaded(products)),
    );
  }
}
