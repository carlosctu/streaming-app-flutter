import 'package:features/home/model/anime_attributes_view_data.dart';
import 'package:features/home/model/anime_list_view_data.dart';
import 'package:features/home/model/home_view_data.dart';
import 'package:features/home/repository/model/home_response.dart';

extension HomeMapper on HomeResponse {
  HomeViewData toViewData() {
    return HomeViewData(
      data: data.map(
        (anime) {
          final attributes = anime.attributes;
          final posterInfo = attributes?.posterImage;
          final posterDimensions = posterInfo?.imageInfo?.dimensions;
          final coverInfo = attributes?.coverImage;
          final converDimensions = coverInfo?.imageInfo?.dimensions;

          return AnimeListViewData(
            id: anime.id,
            type: anime.type,
            links: LinkPathViewData(path: anime.links?.path),
            attributes: AnimeAttributesViewData(
              synopsis: attributes?.synopsis,
              description: attributes?.description,
              coverImageTopOffset: attributes?.coverImageTopOffset,
              canonicalTitle: attributes?.canonicalTitle,
              averageRating: attributes?.averageRating,
              popularityRank: attributes?.popularityRank,
              ageRating: attributes?.ageRating,
              posterImage: PosterImageViewData(
                tiny: posterInfo?.tiny,
                large: posterInfo?.large,
                small: posterInfo?.small,
                medium: posterInfo?.medium,
                original: posterInfo?.original,
                imageInfo: ImageInfoViewData(
                  dimensions: ImageDimensionsViewData(
                    tiny: DimensionSizeViewData(
                      width: posterDimensions?.tiny?.width,
                      height: posterDimensions?.tiny?.height,
                    ),
                    small: DimensionSizeViewData(
                      width: posterDimensions?.small?.width,
                      height: posterDimensions?.small?.height,
                    ),
                    medium: DimensionSizeViewData(
                      width: posterDimensions?.medium?.width,
                      height: posterDimensions?.medium?.height,
                    ),
                    large: DimensionSizeViewData(
                      width: posterDimensions?.large?.width,
                      height: posterDimensions?.large?.height,
                    ),
                  ),
                ),
              ),
              coverImage: PosterImageViewData(
                tiny: coverInfo?.tiny,
                large: coverInfo?.large,
                small: coverInfo?.small,
                medium: coverInfo?.medium,
                original: coverInfo?.original,
                imageInfo: ImageInfoViewData(
                  dimensions: ImageDimensionsViewData(
                    tiny: DimensionSizeViewData(
                      width: converDimensions?.tiny?.width,
                      height: converDimensions?.tiny?.height,
                    ),
                    small: DimensionSizeViewData(
                      width: converDimensions?.small?.width,
                      height: converDimensions?.small?.height,
                    ),
                    medium: DimensionSizeViewData(
                      width: converDimensions?.medium?.width,
                      height: converDimensions?.medium?.height,
                    ),
                    large: DimensionSizeViewData(
                      width: converDimensions?.large?.width,
                      height: converDimensions?.large?.height,
                    ),
                  ),
                ),
              ),
            ),
          );
        },
      ).toList(),
    );
  }
}
