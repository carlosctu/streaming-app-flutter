part of 'home_bloc.dart';

enum HomeStatus {
  valid,
  loading,
  invalid,
}

class HomeState {
  final Map<AnimeTypes, HomeViewData> animeList;
  final Exception? exception;
  final HomeStatus status;
  const HomeState._({
    this.exception,
    this.status = HomeStatus.loading,
    this.animeList = const {},
  });

  const HomeState.initial() : this._();

  HomeState loading() {
    return copyWith(
      status: HomeStatus.loading,
    );
  }

  HomeState validState(Map<AnimeTypes, HomeViewData> animeList) {
    return copyWith(
      animeList: animeList,
      status: HomeStatus.valid,
    );
  }

  HomeState inValidState(Exception? ex) {
    return copyWith(
      exception: ex,
      status: HomeStatus.invalid,
    );
  }

  HomeState copyWith({
    Map<AnimeTypes, HomeViewData>? animeList,
    Exception? exception,
    HomeStatus? status,
  }) {
    return HomeState._(
      animeList: animeList ?? this.animeList,
      exception: exception ?? this.exception,
      status: status ?? this.status,
    );
  }
}
