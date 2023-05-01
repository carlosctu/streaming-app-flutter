// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'get_anime_episode_info_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

GetAnimeEpisodeInfoResponse _$GetAnimeEpisodeInfoResponseFromJson(
        Map<String, dynamic> json) =>
    GetAnimeEpisodeInfoResponse(
      data: EpisodeInfoResponse.fromJson(json['data'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$GetAnimeEpisodeInfoResponseToJson(
        GetAnimeEpisodeInfoResponse instance) =>
    <String, dynamic>{
      'data': instance.data,
    };

EpisodeInfoResponse _$EpisodeInfoResponseFromJson(Map<String, dynamic> json) =>
    EpisodeInfoResponse(
      id: json['id'] as String,
      type: json['type'] as String,
      attributes: EpisodeAttributesResponse.fromJson(
          json['attributes'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$EpisodeInfoResponseToJson(
        EpisodeInfoResponse instance) =>
    <String, dynamic>{
      'id': instance.id,
      'type': instance.type,
      'attributes': instance.attributes,
    };

EpisodeAttributesResponse _$EpisodeAttributesResponseFromJson(
        Map<String, dynamic> json) =>
    EpisodeAttributesResponse(
      synopsis: json['synopsis'] as String?,
      description: json['description'] as String?,
      canonicalTitle: json['canonicalTitle'] as String?,
      seasonNumber: json['seasonNumber'] as int?,
      number: json['number'] as int?,
      episodesCount: json['length'] as int?,
      thumbnail: json['thumbnail'] == null
          ? null
          : ThumbNailInfo.fromJson(json['thumbnail'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$EpisodeAttributesResponseToJson(
        EpisodeAttributesResponse instance) =>
    <String, dynamic>{
      'synopsis': instance.synopsis,
      'description': instance.description,
      'canonicalTitle': instance.canonicalTitle,
      'seasonNumber': instance.seasonNumber,
      'number': instance.number,
      'length': instance.episodesCount,
      'thumbnail': instance.thumbnail,
    };

ThumbNailInfo _$ThumbNailInfoFromJson(Map<String, dynamic> json) =>
    ThumbNailInfo(
      tiny: json['tiny'] as String?,
      large: json['large'] as String?,
      small: json['small'] as String?,
      medium: json['medium'] as String?,
      original: json['original'] as String?,
      imageInfo: json['meta'] == null
          ? null
          : ImageInfo.fromJson(json['meta'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$ThumbNailInfoToJson(ThumbNailInfo instance) =>
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
