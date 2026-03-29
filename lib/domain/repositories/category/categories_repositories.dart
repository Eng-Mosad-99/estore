import 'package:ecommerce_route/domain/entities/response/category/category.dart';

abstract class CategoriesRepositories {
  Future<List<Category>?> getAllCategories();
}