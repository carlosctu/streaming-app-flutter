import 'package:freezed_annotation/freezed_annotation.dart';

part 'anime_attributes_response.g.dart';

@JsonSerializable()
class AnimeAttributesResponse {
  final String? synopsis;
  final String? description;
  final num? coverImageTopOffset;
  final String? canonicalTitle;
  final String? averageRating;
  final num? popularityRank;
  final String? ageRating;
  final PosterImage? posterImage;
  final PosterImage? coverImage;
  AnimeAttributesResponse({
    this.synopsis,
    this.description,
    this.coverImageTopOffset,
    this.canonicalTitle,
    this.averageRating,
    this.popularityRank,
    this.ageRating,
    this.posterImage,
    this.coverImage,
  });

  factory AnimeAttributesResponse.fromJson(Map<String, dynamic> json) =>
      _$AnimeAttributesResponseFromJson(json);
  Map<String, dynamic> toJson() => _$AnimeAttributesResponseToJson(this);
}

@JsonSerializable()
class PosterImage {
  final String? tiny;
  final String? large;
  final String? small;
  final String? medium;
  final String? original;
  @JsonKey(name: 'meta')
  final ImageInfo? imageInfo;
  PosterImage({
    this.tiny,
    this.large,
    this.small,
    this.medium,
    this.original,
    this.imageInfo,
  });

  factory PosterImage.fromJson(Map<String, dynamic> json) =>
      _$PosterImageFromJson(json);
  Map<String, dynamic> toJson() => _$PosterImageToJson(this);
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
