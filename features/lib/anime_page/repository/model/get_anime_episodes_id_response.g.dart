// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'get_anime_episodes_id_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

GetAnimeEpisodesIdResponse _$GetAnimeEpisodesIdResponseFromJson(
        Map<String, dynamic> json) =>
    GetAnimeEpisodesIdResponse(
      data: (json['data'] as List<dynamic>)
          .map((e) => EpisodeInfoResponse.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$GetAnimeEpisodesIdResponseToJson(
        GetAnimeEpisodesIdResponse instance) =>
    <String, dynamic>{
      'data': instance.data,
    };

EpisodeInfoResponse _$EpisodeInfoResponseFromJson(Map<String, dynamic> json) =>
    EpisodeInfoResponse(
      type: json['type'] as String,
      id: json['id'] as String,
    );

Map<String, dynamic> _$EpisodeInfoResponseToJson(
        EpisodeInfoResponse instance) =>
    <String, dynamic>{
      'type': instance.type,
      'id': instance.id,
    };
