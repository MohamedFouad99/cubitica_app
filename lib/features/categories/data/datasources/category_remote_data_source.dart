import 'package:dio/dio.dart';
import '../../../../core/constants/api_constants.dart';
import '../models/category_model.dart';

abstract class CategoryRemoteDataSource {
  Future<List<CategoryModel>> getCategories();
}

class CategoryRemoteDataSourceImpl implements CategoryRemoteDataSource {
  final Dio dio;

  CategoryRemoteDataSourceImpl({required this.dio});

  @override
  Future<List<CategoryModel>> getCategories() async {
    final response = await dio.get('${ApiConstants.apiBaseUrl}category-list');
    final data = List<String>.from(response.data);
    return data.map((e) => CategoryModel.fromJson(e)).toList();
  }
}
