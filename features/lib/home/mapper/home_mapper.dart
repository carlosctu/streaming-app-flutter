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

          return AnimeListViewData(
            id: anime.id,
            type: anime.type,
            links: LinkPathViewData(path: anime.links?.path),
            attributes: AnimeAttributesViewData(
              synopsis: attributes?.synopsis,
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
            ),
          );
        },
      ).toList(),
    );
  }
}
