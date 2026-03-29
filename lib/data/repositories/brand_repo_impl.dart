import 'package:ecommerce_route/data/data_sources/remote/brand_remote_data_source.dart';
import 'package:ecommerce_route/domain/entities/response/common/category_or_brand.dart';
import 'package:ecommerce_route/domain/repositories/brands/brands_repositories.dart';
import 'package:injectable/injectable.dart';

@Injectable(as: BrandsRepositories)
class BrandRepoImpl implements BrandsRepositories{
  final BrandRemoteDataSource brandRemoteDataSource;

  BrandRepoImpl(this.brandRemoteDataSource);
  @override
  Future<List<CategoryOrBrand>?> getAllBrands() {
   return brandRemoteDataSource.getAllBrands();
  }
}