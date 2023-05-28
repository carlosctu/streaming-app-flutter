import 'dart:async';

import 'package:features/anime_page/bloc/anime_page_event.dart';
import 'package:features/anime_page/bloc/anime_page_state.dart';
import 'package:features/anime_page/mapper/anime_page_mapper.dart';
import 'package:features/anime_page/model/get_anime_episodes_info_view_data.dart';
import 'package:features/anime_page/repository/anime_page_repository.dart';
import 'package:features/anime_page/repository/model/get_anime_episode_info_response.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AnimePageBloc extends Bloc<AnimePageEvent, AnimePageState> {
  final AnimePageRepository _repository;

  AnimePageBloc(this._repository) : super(const AnimePageState.initial()) {
    on<AnimePageEventFetchAnimeInfo>(_onFetchAnimeInfo);
  }

  void _onFetchAnimeInfo(
    AnimePageEventFetchAnimeInfo event,
    Emitter<AnimePageState> emit,
  ) async {
    List<String> episodesList = [];
    emit(state.loading());
    
    try {
      GetAnimeEpisodesIdViewData result = await _repository
          .getAnimeEpisodesId(event.animeId)
          .then((value) => value.toViewData());

      episodesList = result.data.map((info) => info.id).toList();

      List<Future<GetAnimeEpisodeInfoResponse>> futures = episodesList
          .map((id) => _repository.getAnimeEpisodeInfo(id))
          .toList();

      List<GetAnimeEpisodeInfoResponse> episodeInfoList =
          await Future.wait(futures);

      emit(state.validState(episodeInfoList));
    } on Exception catch (ex) {
      emit(state.invalidState(ex));
    }
  }

  // Future<List<GetAnimeEpisodeInfoViewData>> fetchAnimeEpisodesInfo(
  //     List<String> episodesList) async {
  //   List<GetAnimeEpisodeInfoViewData> response = [];
  //   try {
  //     final response = await _repository
  //         .getAnimeEpisodeInfo(episodesList[0])
  //         .then((value) => value.toViewData());
  //     print(response);
  //     final data = await Future.wait(episodesList
  //         .map((id) async => _repository
  //             .getAnimeEpisodeInfo(id)
  //             .then((value) => value.toViewData()))
  //         .toList());
  //     print(data[0].data.attributes);
  //     // print(response);
  //     // final data = episodesList.map((id) async {
  //     // final episodeInfo = await _repository
  //     // .getAnimeEpisodeInfo(id)
  //     // .then((value) => value.toViewData());
  //     // response.add(episodeInfo);
  //     // }).toList();
  //     // print(data);
  //     return Future.value([]);
  //   } catch (ex) {
  //     throw Exception(ex);
  //   }
  // }
}
