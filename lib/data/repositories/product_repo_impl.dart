import 'package:ecommerce_route/data/data_sources/remote/category_remote_data_source.dart';
import 'package:ecommerce_route/domain/entities/response/common/category_or_brand.dart';
import 'package:ecommerce_route/domain/repositories/category/categories_repositories.dart';
import 'package:injectable/injectable.dart';

import '../../domain/entities/response/products/product.dart';
import '../../domain/repositories/products/products_repositories.dart';
import '../data_sources/remote/product_remote_data_source.dart';

@Injectable(as: ProductsRepositories)
class ProductRepoImpl implements ProductsRepositories{
  final ProductRemoteDataSource productRemoteDataSource;

  ProductRepoImpl(this.productRemoteDataSource);
  @override
  Future<List<Product>?> getAllProducts() {
   return productRemoteDataSource.getAllProducts();
  }
}