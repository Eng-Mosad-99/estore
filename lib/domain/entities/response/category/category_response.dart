import 'package:ecommerce_route/domain/entities/response/common/category_or_brand.dart';
import 'package:ecommerce_route/domain/entities/response/common/meta_data.dart';
import 'package:json_annotation/json_annotation.dart';

part 'category_response.g.dart';

@JsonSerializable()
class CategoryResponse {
  @JsonKey(name: 'results')
  final int? results;
  @JsonKey(name: 'metadata')
  final Metadata? metadata;
  @JsonKey(name: 'data')
  final List<CategoryOrBrand?>? data;

  CategoryResponse({
    this.results,
    this.metadata,
    this.data,
  });

  
}
