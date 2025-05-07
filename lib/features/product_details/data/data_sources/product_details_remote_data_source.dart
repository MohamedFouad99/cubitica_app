import 'package:dio/dio.dart';

import '../../../../core/constants/api_constants.dart';
import '../models/product_details_model.dart';

abstract class ProductDetailsRemoteDataSource {
  Future<ProductDetailsModel> fetchProductDetails(int id);
}

class ProductDetailsRemoteDataSourceImpl
    implements ProductDetailsRemoteDataSource {
  final Dio dio;

  ProductDetailsRemoteDataSourceImpl(this.dio);

  @override
  Future<ProductDetailsModel> fetchProductDetails(int id) async {
    final response = await dio.get('${ApiConstants.apiBaseUrl}$id');
    return ProductDetailsModel.fromJson(response.data);
  }
}
