import 'package:equatable/equatable.dart';

class AnimeAttributesViewData extends Equatable {
  final String? synopsis;
  final num? coverImageTopOffset;
  final String? canonicalTitle;
  final String? averageRating;
  final num? popularityRank;
  final String? ageRating;
  final PosterImageViewData? posterImage;

  const AnimeAttributesViewData({
    this.synopsis,
    this.coverImageTopOffset,
    this.canonicalTitle,
    this.averageRating,
    this.popularityRank,
    this.ageRating,
    this.posterImage,
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
    this.dimensions,
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
    this.tiny,
    this.large,
    this.small,
    this.medium,
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
    this.width,
    this.height,
  });

  @override
  List<Object?> get props => [
        width,
        height,
      ];
}
