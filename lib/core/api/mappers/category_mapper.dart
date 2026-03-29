import '../../../domain/entities/response/category/category.dart';
import '../models/response/category/category_dto.dart';

extension CategoryMapper on CategoryDto {
  Category toCategory() {
    return Category(
      name: name,
      id: id,
      slug: slug,
      image: image,
      createdAt: createdAt,
      updatedAt: updatedAt,
    );
  }
}
