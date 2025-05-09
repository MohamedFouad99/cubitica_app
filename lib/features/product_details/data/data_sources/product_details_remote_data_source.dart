import 'package:dio/dio.dart';

import '../../../../core/constants/api_constants.dart';
import '../models/product_details_model.dart';

// date: 8 May 2025
// by: Fouad
// last modified at: 9 May 2025
// description: This file contains the ProductDetailsRemoteDataSource interface and its implementation.
abstract class ProductDetailsRemoteDataSource {
  Future<ProductDetailsModel> fetchProductDetails(int id);
}

class ProductDetailsRemoteDataSourceImpl
    implements ProductDetailsRemoteDataSource {
  final Dio dio;

  ProductDetailsRemoteDataSourceImpl(this.dio);

  @override
  /// Retrieves the product details by [id] from the API.
  ///
  /// The method takes an [int] parameter which represents the product
  /// id. The method returns a [Future] that resolves to a [ProductDetailsModel]
  /// or throws a [DioException] if the request fails.
  Future<ProductDetailsModel> fetchProductDetails(int id) async {
    final response = await dio.get('${ApiConstants.apiBaseUrl}$id');
    return ProductDetailsModel.fromJson(response.data);
  }
}
