import 'package:features/home/repository/model/anime_attributes_response.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'anime_list_response.g.dart';

@JsonSerializable()
class AnimeListResponse {
  final String? id;
  final String? type;
  final LinkPathResponse? links;
  final AnimeAttributesResponse? attributes;
  AnimeListResponse({
    this.id,
    this.type,
    this.links,
    this.attributes,
  });
  factory AnimeListResponse.fromJson(Map<String, dynamic> json) =>
      _$AnimeListResponseFromJson(json);
  Map<String, dynamic> toJson() => _$AnimeListResponseToJson(this);
}

@JsonSerializable()
class LinkPathResponse {
  @JsonKey(name: 'self')
  final String? path;
  LinkPathResponse({
     this.path,
  });
  factory LinkPathResponse.fromJson(Map<String, dynamic> json) =>
      _$LinkPathResponseFromJson(json);
  Map<String, dynamic> toJson() => _$LinkPathResponseToJson(this);
}
