import 'package:dio/dio.dart';
import 'package:features/home/repository/model/home_response.dart';

class HomeRepository {
  final _dio = Dio();
  Future<HomeResponse> getTrendingList() async {
    try {
      final result = await _dio.get('https://kitsu.io/api/edge/trending/anime');
      return HomeResponse.fromJson(result.data);
    } catch (ex) {
      throw Exception(ex);
    }
  }

  Future<HomeResponse> getAnimeList(String category, String sort) async {
    try {
      final result = await _dio.get(
          'https://kitsu.io/api/edge/anime?filter[categories]=$category&sort=$sort');
      return HomeResponse.fromJson(result.data);
    } catch (ex) {
      throw Exception(ex);
    }
  }
}
