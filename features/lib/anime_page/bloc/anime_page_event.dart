abstract class AnimePageEvent {}

class AnimePageEventFetchAnimeInfo extends AnimePageEvent {
  String animeId;
  AnimePageEventFetchAnimeInfo({
    required this.animeId,
  });
}

class AnimePageEventFetchEpisodesInfo extends AnimePageEvent {}
