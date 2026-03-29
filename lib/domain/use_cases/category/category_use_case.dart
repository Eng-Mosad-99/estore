import 'package:ecommerce_route/domain/entities/response/common/category_or_brand.dart';
import 'package:ecommerce_route/domain/repositories/category/categories_repositories.dart';
import 'package:injectable/injectable.dart';
@injectable
class CategoryUseCase {
  final CategoriesRepositories categoriesRepositories;
  CategoryUseCase(this.categoriesRepositories);
  Future<List<CategoryOrBrand>?> invoke() {
    return categoriesRepositories.getAllCategories();
  }
}
