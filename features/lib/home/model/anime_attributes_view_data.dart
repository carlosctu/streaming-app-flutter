import 'package:equatable/equatable.dart';

class AnimeAttributesViewData extends Equatable {
  final String? synopsis;
  final String? description;
  final num? coverImageTopOffset;
  final String? canonicalTitle;
  final String? averageRating;
  final num? popularityRank;
  final String? ageRating;
  final PosterImageViewData? posterImage;
  final PosterImageViewData? coverImage;
  final int? episodeLength;
  final String? ageRatingGuide;
  final String? subType;

  const AnimeAttributesViewData({
    required this.synopsis,
    required this.description,
    required this.coverImageTopOffset,
    required this.canonicalTitle,
    required this.averageRating,
    required this.popularityRank,
    required this.ageRating,
    required this.posterImage,
    required this.coverImage,
    required this.episodeLength,
    required this.ageRatingGuide,
    required this.subType,
  });

  @override
  List<Object?> get props {
    return [
      synopsis,
      coverImageTopOffset,
      canonicalTitle,
      averageRating,
      popularityRank,
      ageRating,
      posterImage,
    ];
  }
}

class PosterImageViewData extends Equatable {
  final String? tiny;
  final String? large;
  final String? small;
  final String? medium;
  final String? original;
  final ImageInfoViewData? imageInfo;
  const PosterImageViewData({
    required this.tiny,
    required this.large,
    required this.small,
    required this.medium,
    required this.original,
    required this.imageInfo,
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
