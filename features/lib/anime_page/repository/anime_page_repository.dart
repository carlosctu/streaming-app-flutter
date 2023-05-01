import 'package:dio/dio.dart';
import 'package:features/anime_page/repository/model/get_anime_episode_info_response.dart';
import 'package:features/anime_page/repository/model/get_anime_episodes_id_response.dart';

class AnimePageRepository {
  final _dio = Dio();

  Future<GetAnimeEpisodesIdResponse> getAnimeEpisodesId(String id) async {
    try {
      final result = await _dio
          .get('https://kitsu.io/api/edge/anime/$id/relationships/episodes');
      return GetAnimeEpisodesIdResponse.fromJson(result.data);
    } catch (ex) {
      throw Exception(ex);
    }
  }

  Future<GetAnimeEpisodeInfoResponse> getAnimeEpisodeInfo(String id) async {
    try {
      final result = await _dio.get('https://kitsu.io/api/edge/episodes/$id');
      return GetAnimeEpisodeInfoResponse.fromJson(result.data);
    } catch (ex) {
      throw Exception(ex);
    }
  }
}
