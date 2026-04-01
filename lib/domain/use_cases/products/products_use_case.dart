import 'package:ecommerce_route/domain/entities/response/common/category_or_brand.dart';
import 'package:ecommerce_route/domain/entities/response/products/product.dart';
import 'package:ecommerce_route/domain/repositories/brands/brands_repositories.dart';
import 'package:ecommerce_route/domain/repositories/products/products_repositories.dart';
import 'package:injectable/injectable.dart';

@injectable
class ProductsUseCase {
  final ProductsRepositories productsRepositories;
  ProductsUseCase(this.productsRepositories);
  Future<List<Product>?> invoke() {
    return productsRepositories.getAllProducts();
  }
}
