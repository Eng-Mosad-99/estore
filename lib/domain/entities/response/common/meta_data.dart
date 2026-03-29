import 'package:json_annotation/json_annotation.dart';
part 'meta_data.g.dart';

@JsonSerializable()
class Metadata {
  @JsonKey(name: 'currentPage')
  final int? currentPage;
  @JsonKey(name: 'numberOfPages')
  final int? numberOfPages;
  @JsonKey(name: 'limit')
  final int? limit;

  Metadata({this.currentPage, this.numberOfPages, this.limit});
}
