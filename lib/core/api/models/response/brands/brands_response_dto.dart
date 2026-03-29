import 'package:ecommerce_route/core/api/models/response/common/category_or_brand_dto.dart';
import 'package:json_annotation/json_annotation.dart';
import 'meta_data_dto.dart';

part 'brands_response_dto.g.dart';

@JsonSerializable()
class BrandResponseDto {
  @JsonKey(name: 'results')
  final int? results;
  @JsonKey(name: 'metadata')
  final MetadataDto? metadata;
  @JsonKey(name: 'data')
  final List<CategoryOrBrandDto?>? data;

  BrandResponseDto({this.results, this.metadata, this.data});

  factory BrandResponseDto.fromJson(Map<String, dynamic> json) =>
      _$BrandResponseDtoFromJson(json);
  Map<String, dynamic> toJson() => _$BrandResponseDtoToJson(this);
}

