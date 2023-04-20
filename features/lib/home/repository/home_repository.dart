import 'package:dio/dio.dart';
import 'package:features/home/home.dart';
import 'package:features/home/model/home_response.dart';

class HomeRepository {
  final _dio = Dio();
  Future<HomeResponse> getAnimeList() async {
    try {
      final result = await _dio.get('https://kitsu.io/api/edge/trending/anime');
      return HomeResponse.fromJson(result.data);
    } catch (ex) {
      throw Exception(ex);
    }
  }
}
