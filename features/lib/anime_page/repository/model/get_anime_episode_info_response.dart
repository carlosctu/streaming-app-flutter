import 'package:freezed_annotation/freezed_annotation.dart';

part 'get_anime_episode_info_response.g.dart';

@JsonSerializable()
class GetAnimeEpisodeInfoResponse {
  final EpisodeInfoResponse data;
  GetAnimeEpisodeInfoResponse({
    required this.data,
  });

  factory GetAnimeEpisodeInfoResponse.fromJson(Map<String, dynamic> json) =>
      _$GetAnimeEpisodeInfoResponseFromJson(json);
  Map<String, dynamic> toJson() => _$GetAnimeEpisodeInfoResponseToJson(this);
}

@JsonSerializable()
class EpisodeInfoResponse {
  final String id;
  final String type;
  final EpisodeAttributesResponse attributes;
  EpisodeInfoResponse({
    required this.id,
    required this.type,
    required this.attributes,
  });

  factory EpisodeInfoResponse.fromJson(Map<String, dynamic> json) =>
      _$EpisodeInfoResponseFromJson(json);
  Map<String, dynamic> toJson() => _$EpisodeInfoResponseToJson(this);
}

@JsonSerializable()
class EpisodeAttributesResponse {
  final String? synopsis;
  final String? description;
  final String? canonicalTitle;
  final int? seasonNumber;
  final int? number;
  @JsonKey(name: 'length')
  final int? episodesCount;
  final ThumbNailInfo? thumbnail;
  EpisodeAttributesResponse({
    this.synopsis,
    this.description,
    this.canonicalTitle,
    this.seasonNumber,
    this.number,
    this.episodesCount,
    this.thumbnail,
  });

  factory EpisodeAttributesResponse.fromJson(Map<String, dynamic> json) =>
      _$EpisodeAttributesResponseFromJson(json);
  Map<String, dynamic> toJson() => _$EpisodeAttributesResponseToJson(this);
}

@JsonSerializable()
class ThumbNailInfo {
  final String? tiny;
  final String? large;
  final String? small;
  final String? medium;
  final String? original;
  @JsonKey(name: 'meta')
  final ImageInfo? imageInfo;
  ThumbNailInfo({
    this.tiny,
    this.large,
    this.small,
    this.medium,
    this.original,
    this.imageInfo,
  });

  factory ThumbNailInfo.fromJson(Map<String, dynamic> json) =>
      _$ThumbNailInfoFromJson(json);
  Map<String, dynamic> toJson() => _$ThumbNailInfoToJson(this);
}

@JsonSerializable()
class ImageInfo {
  final ImageDimensions? dimensions;
  ImageInfo({
    this.dimensions,
  });
  factory ImageInfo.fromJson(Map<String, dynamic> json) =>
      _$ImageInfoFromJson(json);
  Map<String, dynamic> toJson() => _$ImageInfoToJson(this);
}

@JsonSerializable()
class ImageDimensions {
  final DimensionSize? tiny;
  final DimensionSize? large;
  final DimensionSize? small;
  final DimensionSize? medium;
  ImageDimensions({
    this.tiny,
    this.large,
    this.small,
    this.medium,
  });

  factory ImageDimensions.fromJson(Map<String, dynamic> json) =>
      _$ImageDimensionsFromJson(json);
  Map<String, dynamic> toJson() => _$ImageDimensionsToJson(this);
}

@JsonSerializable()
class DimensionSize {
  final int? width;
  final int? height;
  DimensionSize({
    this.width,
    this.height,
  });

  factory DimensionSize.fromJson(Map<String, dynamic> json) =>
      _$DimensionSizeFromJson(json);
  Map<String, dynamic> toJson() => _$DimensionSizeToJson(this);
}
