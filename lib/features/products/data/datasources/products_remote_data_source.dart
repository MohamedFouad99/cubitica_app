import 'package:dio/dio.dart';
import '../../../../core/constants/api_constants.dart';
import '../models/product_model.dart';

abstract class ProductsRemoteDataSource {
  Future<List<ProductModel>> getProductsByCategory(String category);
}

class ProductsRemoteDataSourceImpl implements ProductsRemoteDataSource {
  final Dio dio;

  ProductsRemoteDataSourceImpl(this.dio);

  @override
  Future<List<ProductModel>> getProductsByCategory(String category) async {
    final response = await dio.get(
      '${ApiConstants.apiBaseUrl}category/$category',
    );
    final productsJson = response.data['products'] as List;
    return productsJson.map((e) => ProductModel.fromJson(e)).toList();
  }
}
