// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'anime_list_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AnimeListResponse _$AnimeListResponseFromJson(Map<String, dynamic> json) =>
    AnimeListResponse(
      id: json['id'] as String?,
      type: json['type'] as String?,
      links: json['links'] == null
          ? null
          : LinkPathResponse.fromJson(json['links'] as Map<String, dynamic>),
      attributes: json['attributes'] == null
          ? null
          : AnimeAttributesResponse.fromJson(
              json['attributes'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$AnimeListResponseToJson(AnimeListResponse instance) =>
    <String, dynamic>{
      'id': instance.id,
      'type': instance.type,
      'links': instance.links,
      'attributes': instance.attributes,
    };

LinkPathResponse _$LinkPathResponseFromJson(Map<String, dynamic> json) =>
    LinkPathResponse(
      path: json['self'] as String?,
    );

Map<String, dynamic> _$LinkPathResponseToJson(LinkPathResponse instance) =>
    <String, dynamic>{
      'self': instance.path,
    };
