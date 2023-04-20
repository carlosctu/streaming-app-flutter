// ignore_for_file: depend_on_referenced_packages
import 'dart:async';

import 'package:features/home/model/home_view_data.dart';
import 'package:features/home/repository/home_repository.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';
import 'package:features/home/mapper/home_mapper.dart';

part 'home_event.dart';
part 'home_state.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  final HomeRepository _repository;
  final _dataController = StreamController();

  HomeBloc(this._repository) : super(HomeInitialState()) {
    // ignore: void_checks
    on<HomeEventFetchAnimeList>((event, emit) {
      return _repository.getAnimeList();
    });
  }

  void fetch() async {
    try {
      final response = await _repository.getAnimeList();
      _dataController.sink.add(response.toViewData());
    } catch (ex) {
      throw Exception(ex);
    }
  }

  Stream get dataStream => _dataController.stream;

  void dispose() {
    _dataController.close();
  }
}
