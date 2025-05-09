import 'package:dio/dio.dart';

import '../../../../core/constants/api_constants.dart';
import '../models/product_model.dart';

// date: 8 May 2025
// by: Fouad
// last modified at: 9 May 2025
// description: This file contains the ProductsRemoteDataSource interface and its implementation.
abstract class ProductsRemoteDataSource {
  Future<List<ProductModel>> getProductsByCategory(String category);
}

class ProductsRemoteDataSourceImpl implements ProductsRemoteDataSource {
  final Dio dio;

  ProductsRemoteDataSourceImpl(this.dio);

  @override
  /// Retrieves the list of products by category from the API.
  ///
  /// The method takes a [String] parameter which represents the category
  /// name. The method returns a [Future] that resolves to a [List] of
  /// [ProductModel] or throws a [DioException] if the request fails.
  Future<List<ProductModel>> getProductsByCategory(String category) async {
    final response = await dio.get(
      '${ApiConstants.apiBaseUrl}${ApiConstants.category}$category',
    );
    final productsJson = response.data['products'] as List;
    return productsJson.map((e) => ProductModel.fromJson(e)).toList();
  }
}
