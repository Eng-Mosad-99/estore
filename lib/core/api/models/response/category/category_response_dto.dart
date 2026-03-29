import 'package:ecommerce_route/core/api/models/response/common/category_or_brand_dto.dart';
import 'package:ecommerce_route/core/api/models/response/common/meta_data_dto.dart';
import 'package:json_annotation/json_annotation.dart';

part 'category_response_dto.g.dart';

@JsonSerializable()
class CategoryResponseDto {
  @JsonKey(name: 'results')
  final int? results;
  @JsonKey(name: 'metadata')
  final MetaDataDto? metadata;
  @JsonKey(name: 'data')
  final List<CategoryOrBrandDto?>? data;

  CategoryResponseDto({
    this.results,
    this.metadata,
    this.data,
  });

  factory CategoryResponseDto.fromJson(Map<String, dynamic> json) => _$CategoryResponseDtoFromJson(json);
  Map<String, dynamic> toJson() => _$CategoryResponseDtoToJson(this);
}

