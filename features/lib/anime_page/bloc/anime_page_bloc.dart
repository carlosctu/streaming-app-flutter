import 'dart:async';

import 'package:features/anime_page/mapper/anime_page_mapper.dart';
import 'package:features/anime_page/model/get_anime_episodes_info_view_data.dart';
import 'package:features/anime_page/repository/anime_page_repository.dart';
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
    try {
      GetAnimeEpisodesIdViewData result = await _repository
          .getAnimeEpisodesId(animeId)
          .then((value) => value.toViewData());
      print(result.data);
      _dataController.sink.add(result);
    } catch (ex) {
      throw Exception(ex);
    }
  }

  Stream get dataStream => _dataController.stream;

  void dispose() {
    _dataController.close();
  }
}
