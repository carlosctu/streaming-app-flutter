// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'anime_attributes_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AnimeAttributesResponse _$AnimeAttributesResponseFromJson(
        Map<String, dynamic> json) =>
    AnimeAttributesResponse(
      synopsis: json['synopsis'] as String?,
      description: json['description'] as String?,
      coverImageTopOffset: json['coverImageTopOffset'] as num?,
      canonicalTitle: json['canonicalTitle'] as String?,
      averageRating: json['averageRating'] as String?,
      popularityRank: json['popularityRank'] as num?,
      ageRating: json['ageRating'] as String?,
      posterImage: json['posterImage'] == null
          ? null
          : PosterImage.fromJson(json['posterImage'] as Map<String, dynamic>),
      coverImage: json['coverImage'] == null
          ? null
          : PosterImage.fromJson(json['coverImage'] as Map<String, dynamic>),
      episodeLength: json['episodeLength'] as int?,
      ageRatingGuide: json['ageRatingGuide'] as String?,
      subtype: json['subtype'] as String?,
    );

Map<String, dynamic> _$AnimeAttributesResponseToJson(
        AnimeAttributesResponse instance) =>
    <String, dynamic>{
      'synopsis': instance.synopsis,
      'description': instance.description,
      'coverImageTopOffset': instance.coverImageTopOffset,
      'canonicalTitle': instance.canonicalTitle,
      'averageRating': instance.averageRating,
      'popularityRank': instance.popularityRank,
      'ageRating': instance.ageRating,
      'posterImage': instance.posterImage,
      'coverImage': instance.coverImage,
      'episodeLength': instance.episodeLength,
      'ageRatingGuide': instance.ageRatingGuide,
      'subtype': instance.subtype,
    };

PosterImage _$PosterImageFromJson(Map<String, dynamic> json) => PosterImage(
      tiny: json['tiny'] as String?,
      large: json['large'] as String?,
      small: json['small'] as String?,
      medium: json['medium'] as String?,
      original: json['original'] as String?,
      imageInfo: json['meta'] == null
          ? null
          : ImageInfo.fromJson(json['meta'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$PosterImageToJson(PosterImage instance) =>
    <String, dynamic>{
      'tiny': instance.tiny,
      'large': instance.large,
      'small': instance.small,
      'medium': instance.medium,
      'original': instance.original,
      'meta': instance.imageInfo,
    };

ImageInfo _$ImageInfoFromJson(Map<String, dynamic> json) => ImageInfo(
      dimensions: json['dimensions'] == null
          ? null
          : ImageDimensions.fromJson(
              json['dimensions'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$ImageInfoToJson(ImageInfo instance) => <String, dynamic>{
      'dimensions': instance.dimensions,
    };

ImageDimensions _$ImageDimensionsFromJson(Map<String, dynamic> json) =>
    ImageDimensions(
      tiny: json['tiny'] == null
          ? null
          : DimensionSize.fromJson(json['tiny'] as Map<String, dynamic>),
      large: json['large'] == null
          ? null
          : DimensionSize.fromJson(json['large'] as Map<String, dynamic>),
      small: json['small'] == null
          ? null
          : DimensionSize.fromJson(json['small'] as Map<String, dynamic>),
      medium: json['medium'] == null
          ? null
          : DimensionSize.fromJson(json['medium'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$ImageDimensionsToJson(ImageDimensions instance) =>
    <String, dynamic>{
      'tiny': instance.tiny,
      'large': instance.large,
      'small': instance.small,
      'medium': instance.medium,
    };

DimensionSize _$DimensionSizeFromJson(Map<String, dynamic> json) =>
    DimensionSize(
      width: json['width'] as int?,
      height: json['height'] as int?,
    );

Map<String, dynamic> _$DimensionSizeToJson(DimensionSize instance) =>
    <String, dynamic>{
      'width': instance.width,
      'height': instance.height,
    };
