import 'package:ecommerce_route/domain/entities/response/common/category_or_brand.dart';

abstract class BrandsRepositories {
  Future<List<CategoryOrBrand>?> getAllBrands();
}