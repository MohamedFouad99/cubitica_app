import 'package:cubitica_app/features/product_details/domain/usecases/fetch_product_details_usecase.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'product_details_state.dart';

class ProductDetailsCubit extends Cubit<ProductDetailsState> {
  final FetchProductDetailsUseCase fetchProductDetailsUseCase;

  ProductDetailsCubit(this.fetchProductDetailsUseCase)
    : super(ProductDetailsInitial());

  Future<void> getProductDetails(int id) async {
    emit(ProductDetailsLoading());

    final result = await fetchProductDetailsUseCase(id);

    result.fold(
      (failure) => emit(ProductDetailsError(failure.message)),
      (productDetails) => emit(ProductDetailsLoaded(productDetails)),
    );
  }
}
