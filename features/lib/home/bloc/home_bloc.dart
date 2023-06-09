// ignore_for_file: depend_on_referenced_packages
import 'dart:async';
import 'package:features/home/model/home_view_data.dart';
import 'package:features/home/repository/home_repository.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';
import 'package:features/home/mapper/home_mapper.dart';

part 'home_event.dart';
part 'home_state.dart';

enum AnimeTypes { trending, romance, shounen, newUpdates }

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  final HomeRepository _repository;

  HomeBloc(this._repository) : super(const HomeState.initial()) {
    on<HomeEventFetchAnimeList>(_onFetchAnimeList);
  }

  void _onFetchAnimeList(
    HomeEventFetchAnimeList event,
    Emitter<HomeState> emit,
  ) async {
    emit(state.loading());

    try {
      Map<AnimeTypes, HomeViewData> response = {};

      final results = await Future.wait([
        _repository.getTrendingList().then((data) => data.toViewData()),
        _repository
            .getAnimeList('fantasy', 'popularityRank')
            .then((data) => data.toViewData()),
        _repository
            .getAnimeList('drama', '-averageRating')
            .then((data) => data.toViewData()),
        _repository
            .getAnimeList('romance', 'popularityRank')
            .then((data) => data.toViewData())
      ]);

      response[AnimeTypes.trending] = results[0];
      response[AnimeTypes.newUpdates] = results[1];
      response[AnimeTypes.shounen] = results[2];
      response[AnimeTypes.romance] = results[3];

      emit(state.validState(response));
    } on Exception catch (ex) {
      emit(state.inValidState(ex));
    }
  }
}
