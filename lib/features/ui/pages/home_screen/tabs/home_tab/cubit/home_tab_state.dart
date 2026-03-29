import '../../../../../../../domain/entities/response/category/category.dart';

abstract class HomeTabState {}

final class HomeTabInitial extends HomeTabState {}

final class CategoryLoading extends HomeTabState {}

final class CategoryLoaded extends HomeTabState {
  final List<Category> categories;
  CategoryLoaded({required this.categories});
} 

final class CategoryError extends HomeTabState {
  final String errorMsg;
  CategoryError({required this.errorMsg});
}