import 'package:features/home/repository/model/anime_list_response.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'home_response.g.dart';

@JsonSerializable()
class HomeResponse {
  final List<AnimeListResponse> data;
  HomeResponse({
    required this.data,
  });
  factory HomeResponse.fromJson(Map<String, dynamic> json) =>
      _$HomeResponseFromJson(json);
  Map<String, dynamic> toJson() => _$HomeResponseToJson(this);
}
