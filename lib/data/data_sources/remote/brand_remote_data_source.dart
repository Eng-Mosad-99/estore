import 'package:ecommerce_route/domain/entities/response/common/category_or_brand.dart';

abstract class BrandRemoteDataSource {
  Future<List<CategoryOrBrand>?> getAllBrands();
}