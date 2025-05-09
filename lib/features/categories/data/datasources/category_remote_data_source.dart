import 'package:dio/dio.dart';

import '../../../../core/constants/api_constants.dart';
import '../models/category_model.dart';

// date: 8 May 2025
// by: Fouad
// last modified at: 8 May 2025
// description: This file contains the CategoryRemoteDataSource interface and its implementation.
abstract class CategoryRemoteDataSource {
  /// Fetches the list of categories from the API.
  Future<List<CategoryModel>> getCategories();
}

class CategoryRemoteDataSourceImpl implements CategoryRemoteDataSource {
  final Dio dio;

  CategoryRemoteDataSourceImpl({required this.dio});

  @override
  /// Fetches the list of categories from the API.
  ///
  /// The API endpoint returns a list of category names. Each name is
  /// converted to a [CategoryModel] and returned as a list.
  ///
  /// Throws a [DioException] if the request fails.
  Future<List<CategoryModel>> getCategories() async {
    final response = await dio.get(
      '${ApiConstants.apiBaseUrl}${ApiConstants.categoryList}',
    );
    final data = List<String>.from(response.data);
    return data.map((e) => CategoryModel.fromJson(e)).toList();
  }
}
