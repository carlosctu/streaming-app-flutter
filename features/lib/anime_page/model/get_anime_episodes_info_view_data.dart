import 'package:equatable/equatable.dart';

class GetAnimeEpisodesInfoViewData extends Equatable {
  final List<EpisodeInfoViewData> data;
  const GetAnimeEpisodesInfoViewData({
    required this.data,
  });

  @override
  List<Object> get props => [data];
}

class EpisodeInfoViewData extends Equatable {
  final String id;
  final String type;
  const EpisodeInfoViewData({
    required this.id,
    required this.type,
  });

  @override
  List<Object> get props => [id, type];
}
