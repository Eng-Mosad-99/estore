import 'package:ecommerce_route/domain/entities/response/category/category.dart';

abstract class CategoryRemoteDataSource {
  Future<List<Category>?> getAllCategories();
}