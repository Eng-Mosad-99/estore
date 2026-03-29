import 'package:ecommerce_route/domain/entities/response/category/category.dart';
import 'package:ecommerce_route/domain/repositories/category/categories_repositories.dart';
import 'package:injectable/injectable.dart';
@injectable
class CategoryUseCase {
  final CategoriesRepositories categoriesRepositories;
  CategoryUseCase(this.categoriesRepositories);
  Future<List<Category>?> invoke() {
    return categoriesRepositories.getAllCategories();
  }
}
