import 'package:freezed_annotation/freezed_annotation.dart';

part 'get_anime_episodes_id_response.g.dart';

@JsonSerializable()
class GetAnimeEpisodesIdResponse {
  final List<EpisodeInfoResponse> data;
  GetAnimeEpisodesIdResponse({
    required this.data,
  });

  factory GetAnimeEpisodesIdResponse.fromJson(Map<String, dynamic> json) =>
      _$GetAnimeEpisodesIdResponseFromJson(json);
  Map<String, dynamic> toJson() => _$GetAnimeEpisodesIdResponseToJson(this);
}

@JsonSerializable()
class EpisodeInfoResponse {
  final String type;
  final String id;
  EpisodeInfoResponse({
    required this.type,
    required this.id,
  });

  factory EpisodeInfoResponse.fromJson(Map<String, dynamic> json) =>
      _$EpisodeInfoResponseFromJson(json);
  Map<String, dynamic> toJson() => _$EpisodeInfoResponseToJson(this);
}
