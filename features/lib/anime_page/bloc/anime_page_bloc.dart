import 'dart:async';

import 'package:features/anime_page/mapper/anime_page_mapper.dart';
import 'package:features/anime_page/model/get_anime_episode_info_view_data.dart';
import 'package:features/anime_page/model/get_anime_episodes_info_view_data.dart';
import 'package:features/anime_page/repository/anime_page_repository.dart';
import 'package:features/anime_page/repository/model/get_anime_episode_info_response.dart';
import 'package:features/home/bloc/home_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'anime_page_event.dart';
part 'anime_page_state.dart';

class AnimePageBloc extends Bloc<AnimePageEvent, AnimePageState> {
  final AnimePageRepository _repository;
  final String animeId;
  final _dataController = StreamController();

  AnimePageBloc(
    this._repository, {
    required this.animeId,
  }) : super(AnimePageInitialState()) {
    fetch();
  }

  void fetch() async {
    List<String> episodesList = [];
    try {
      GetAnimeEpisodesIdViewData result = await _repository
          .getAnimeEpisodesId(animeId)
          .then((value) => value.toViewData());

      episodesList = result.data.map((info) => info.id).toList();

      List<Future<GetAnimeEpisodeInfoResponse>> futures = episodesList
          .map((id) => _repository.getAnimeEpisodeInfo(id))
          .toList();

      List<GetAnimeEpisodeInfoResponse> episodeInfoList =
          await Future.wait(futures);

      final response = episodeInfoList.map((e) => e.toViewData());

      print(response);

      // final viewDataList = episodeInfoList.map((info) {
      //   return info.toViewData();
      // }).toList();

      print(episodeInfoList);

      final data = episodeInfoList.map((e) => e.toViewData()).toList();

      // final response = await Future.wait(episodesList
      //     .map(
      //       (id) async => await _repository
      //           .getAnimeEpisodeInfo(id)
      //           .then((value) => value.toViewData()),
      //     )
      //     .toList());

      // print(response);

      // final episodesInfo = await fetchAnimeEpisodesInfo(episodesList);

      // print(episodesInfo);
      // _dataController.sink.add(episodesInfo);
    } catch (ex) {
      throw Exception(ex);
    }
  }

  Future<List<GetAnimeEpisodeInfoViewData>> fetchAnimeEpisodesInfo(
      List<String> episodesList) async {
    List<GetAnimeEpisodeInfoViewData> response = [];
    try {
      final response = await _repository
          .getAnimeEpisodeInfo(episodesList[0])
          .then((value) => value.toViewData());
      print(response);
      final data = await Future.wait(episodesList
          .map((id) async => _repository
              .getAnimeEpisodeInfo(id)
              .then((value) => value.toViewData()))
          .toList());
      print(data[0].data.attributes);
      // print(response);
      // final data = episodesList.map((id) async {
      // final episodeInfo = await _repository
      // .getAnimeEpisodeInfo(id)
      // .then((value) => value.toViewData());
      // response.add(episodeInfo);
      // }).toList();
      // print(data);
      return Future.value([]);
    } catch (ex) {
      throw Exception(ex);
    }
  }

  Stream get dataStream => _dataController.stream;

  void dispose() {
    _dataController.close();
  }
}
