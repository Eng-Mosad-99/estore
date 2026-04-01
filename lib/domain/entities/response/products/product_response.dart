
import 'package:json_annotation/json_annotation.dart';

import '../common/meta_data.dart';
import 'product.dart';

part 'product_response.g.dart';

@JsonSerializable()
class ProductResponse {
  @JsonKey(name: 'results')
  final int? results;
  @JsonKey(name: 'metadata')
  final Metadata? metadata;
  @JsonKey(name: 'data')
  final List<Product?>? data;

  ProductResponse({this.results, this.metadata, this.data});

}
