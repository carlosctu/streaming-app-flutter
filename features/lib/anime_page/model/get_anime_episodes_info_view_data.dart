import 'package:equatable/equatable.dart';

class GetAnimeEpisodesIdViewData extends Equatable {
  final List<EpisodeInfoIdViewData> data;
  const GetAnimeEpisodesIdViewData({
    required this.data,
  });

  @override
  List<Object> get props => [data];
}

class EpisodeInfoIdViewData extends Equatable {
  final String id;
  final String type;
  const EpisodeInfoIdViewData({
    required this.id,
    required this.type,
  });

  @override
  List<Object> get props => [id, type];
}
