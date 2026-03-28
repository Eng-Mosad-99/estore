import 'package:ecommerce_route/domain/entities/response/category/category_data.dart';
import 'package:json_annotation/json_annotation.dart';

import '../common/meta_data.dart';

part 'category_response.g.dart';

@JsonSerializable()
class CategoryResponse {
  @JsonKey(name: 'results')
  final int? results;
  @JsonKey(name: 'metadata')
  final Metadata? metadata;
  @JsonKey(name: 'data')
  final List<CategoryData?>? data;

  CategoryResponse({
    this.results,
    this.metadata,
    this.data,
  });

  factory CategoryResponse.fromJson(Map<String, dynamic> json) => _$CategoryResponseFromJson(json);
  Map<String, dynamic> toJson() => _$CategoryResponseToJson(this);
}
