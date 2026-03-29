import '../../../../../../../domain/entities/response/common/category_or_brand.dart';

abstract class HomeTabState {}

final class HomeTabInitial extends HomeTabState {}

final class CategoryLoading extends HomeTabState {}

final class CategoryLoaded extends HomeTabState {
  final List<CategoryOrBrand> categories;
  CategoryLoaded({required this.categories});
} 

final class CategoryError extends HomeTabState {
  final String errorMsg;
  CategoryError({required this.errorMsg});
}

final class BrandsLoading extends HomeTabState {}

final class BrandsLoaded extends HomeTabState {
  final List<CategoryOrBrand> brands;
  BrandsLoaded({required this.brands});
} 

final class BrandsError extends HomeTabState {
  final String errorMsg;
  BrandsError({required this.errorMsg});
}