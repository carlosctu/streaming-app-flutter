import 'package:features/anime_page/repository/model/get_anime_episode_info_response.dart';

enum AnimePageStatus {
  valid,
  loading,
  invalid,
}

class AnimePageState {
  final AnimePageStatus status;
  final List<GetAnimeEpisodeInfoResponse> data;
  final Exception? exception;
  const AnimePageState._({
    this.status = AnimePageStatus.loading,
    this.data = const [],
    this.exception,
  });

  const AnimePageState.initial() : this._();

  AnimePageState loading() {
    return copyWith(
      status: AnimePageStatus.loading,
    );
  }

  AnimePageState validState(List<GetAnimeEpisodeInfoResponse> animeInfo) {
    return copyWith(
      status: AnimePageStatus.valid,
      data: animeInfo,
    );
  }

  AnimePageState invalidState(Exception? ex) {
    return copyWith(
      status: AnimePageStatus.invalid,
      exception: ex,
    );
  }

  AnimePageState copyWith({
    AnimePageStatus? status,
    List<GetAnimeEpisodeInfoResponse>? data,
    Exception? exception,
  }) {
    return AnimePageState._(
      status: status ?? this.status,
      data: data ?? this.data,
      exception: exception ?? this.exception,
    );
  }
}
