import 'package:equatable/equatable.dart';

class GetAnimeEpisodeInfoViewData extends Equatable {
  final EpisodeInfoViewData data;
  const GetAnimeEpisodeInfoViewData({
    required this.data,
  });

  @override
  List<Object> get props => [data];
}

class EpisodeInfoViewData extends Equatable {
  final String id;
  final String type;
  final EpisodeAttributesViewData attributes;
  const EpisodeInfoViewData({
    required this.id,
    required this.type,
    required this.attributes,
  });

  @override
  List<Object> get props => [id, type, attributes];
}

class EpisodeAttributesViewData extends Equatable {
  final String? synopsis;
  final String? description;
  final String? canonicalTitle;
  final int? seasonNumber;
  final int? number;
  final int? episodesCount;
  final ThumbNailInfoViewData? thumbnail;
  const EpisodeAttributesViewData({
    this.synopsis,
    this.description,
    this.canonicalTitle,
    this.seasonNumber,
    this.number,
    this.episodesCount,
    required this.thumbnail,
  });

  @override
  List<Object?> get props {
    return [
      synopsis,
      description,
      canonicalTitle,
      seasonNumber,
      number,
      episodesCount,
      thumbnail,
    ];
  }
}

class ThumbNailInfoViewData extends Equatable {
  final String? tiny;
  final String? large;
  final String? small;
  final String? medium;
  final String? original;
  final ImageInfoViewData? imageInfo;
  const ThumbNailInfoViewData({
    this.tiny,
    this.large,
    this.small,
    this.medium,
    this.original,
    this.imageInfo,
  });

  @override
  List<Object?> get props {
    return [
      tiny,
      large,
      small,
      medium,
      original,
      imageInfo,
    ];
  }
}

class ImageInfoViewData extends Equatable {
  final ImageDimensionsViewData? dimensions;
  const ImageInfoViewData({
    required this.dimensions,
  });

  @override
  List<Object?> get props => [dimensions];
}

class ImageDimensionsViewData extends Equatable {
  final DimensionSizeViewData? tiny;
  final DimensionSizeViewData? large;
  final DimensionSizeViewData? small;
  final DimensionSizeViewData? medium;
  const ImageDimensionsViewData({
    required this.tiny,
    required this.large,
    required this.small,
    required this.medium,
  });

  @override
  List<Object?> get props => [
        tiny,
        large,
        small,
        medium,
      ];
}

class DimensionSizeViewData extends Equatable {
  final int? width;
  final int? height;
  const DimensionSizeViewData({
    required this.width,
    required this.height,
  });

  @override
  List<Object?> get props => [
        width,
        height,
      ];
}
