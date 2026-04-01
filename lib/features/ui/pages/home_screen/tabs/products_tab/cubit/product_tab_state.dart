
import 'package:ecommerce_route/domain/entities/response/products/product.dart';

abstract class ProductTabState {}

final class ProductTabInitial extends ProductTabState {}

final class ProductLoading extends ProductTabState{}
final class ProductError extends ProductTabState{
  final String errorMsg;

  ProductError({required this.errorMsg});

}
final class ProductSuccess extends ProductTabState{
 final List<Product>? products;

  ProductSuccess({required this.products});
}