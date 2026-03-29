import 'package:ecommerce_route/data/data_sources/remote/category_remote_data_source.dart';
import 'package:ecommerce_route/domain/entities/response/common/category_or_brand.dart';
import 'package:ecommerce_route/domain/repositories/category/categories_repositories.dart';
import 'package:injectable/injectable.dart';

@Injectable(as: CategoriesRepositories)
class CategoryRepoImpl implements CategoriesRepositories{
  final CategoryRemoteDataSource categoryRemoteDataSource;

  CategoryRepoImpl(this.categoryRemoteDataSource);
  @override
  Future<List<CategoryOrBrand>?> getAllCategories() {
   return categoryRemoteDataSource.getAllCategories();
  }
}