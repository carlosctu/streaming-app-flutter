import 'package:features/anime_page/model/get_anime_episode_info_view_data.dart';
import 'package:features/anime_page/model/get_anime_episodes_info_view_data.dart';
import 'package:features/anime_page/repository/model/get_anime_episode_info_response.dart';
import 'package:features/anime_page/repository/model/get_anime_episodes_id_response.dart';

extension GetAnimeEpisodesIdMapper on GetAnimeEpisodesIdResponse {
  GetAnimeEpisodesIdViewData toViewData() {
    return GetAnimeEpisodesIdViewData(
      data: data.map((episode) {
        return EpisodeInfoIdViewData(
          id: episode.id,
          type: episode.type,
        );
      }).toList(),
    );
  }
}

extension GetAnimeEpisodeInfoMapper on GetAnimeEpisodeInfoResponse {
  GetAnimeEpisodeInfoViewData toViewData() {
    final attributes = data.attributes;
    final thumbnailInfo = attributes.thumbnail;
    final thumbnailDimensions = thumbnailInfo?.imageInfo?.dimensions;
    return GetAnimeEpisodeInfoViewData(
      data: EpisodeInfoViewData(
        id: data.id,
        type: data.type,
        attributes: EpisodeAttributesViewData(
          thumbnail: ThumbNailInfoViewData(
            imageInfo: ImageInfoViewData(
              dimensions: ImageDimensionsViewData(
                large: DimensionSizeViewData(
                  height: thumbnailDimensions?.large?.height,
                  width: thumbnailDimensions?.large?.width,
                ),
                medium: DimensionSizeViewData(
                  height: thumbnailDimensions?.medium?.height,
                  width: thumbnailDimensions?.medium?.width,
                ),
                small: DimensionSizeViewData(
                  height: thumbnailDimensions?.small?.height,
                  width: thumbnailDimensions?.small?.width,
                ),
                tiny: DimensionSizeViewData(
                  height: thumbnailDimensions?.tiny?.height,
                  width: thumbnailDimensions?.tiny?.width,
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
