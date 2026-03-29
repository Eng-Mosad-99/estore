import 'package:ecommerce_route/domain/entities/response/common/category_or_brand.dart';
import 'package:ecommerce_route/domain/repositories/brands/brands_repositories.dart';
import 'package:injectable/injectable.dart';

@injectable
class BrandsUseCase {
  final BrandsRepositories brandsRepositories;
  BrandsUseCase(this.brandsRepositories);
  Future<List<CategoryOrBrand>?> invoke() {
    return brandsRepositories.getAllBrands();
  }
}
