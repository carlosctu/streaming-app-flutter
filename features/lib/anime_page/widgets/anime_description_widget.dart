import 'package:features/home/model/anime_list_view_data.dart';
import 'package:features/home/widgets/config/anime_rating_config.dart';
import 'package:features/home/widgets/config/trending_anime_age_rating_mixin.dart';
import 'package:features/shared/utils/expandable_text_widget.dart';
import 'package:flutter/material.dart';

class AnimeDescriptionWidget extends StatelessWidget with AgeRatingMixin {
  final AnimeViewData anime;
  const AnimeDescriptionWidget({
    super.key,
    required this.anime,
  });

  @override
  Widget build(BuildContext context) {
    String title = anime.attributes?.canonicalTitle ?? '';
    String? ageRating = anime.attributes?.ageRating;
    AnimeGuideConfig animeRatingconfig = getAgeGuide(ageRating);

    return Wrap(
      runSpacing: 12,
      children: [
        _buildAnimeTitle(title),
        _buildAnimeInformationGuide(animeRatingconfig),
        ExpandableTextWidget(
          text: anime.attributes?.synopsis?.split('(')[0],
          trimLines: 4,
        ),
      ],
    );
  }

  Widget _buildAnimeTitle(String title) {
    return Text(
      title,
      style: const TextStyle(
        fontSize: 18,
        fontWeight: FontWeight.w600,
      ),
    );
  }

  Widget _buildAnimeInformationGuide(AnimeGuideConfig animeGuide) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Container(
          alignment: Alignment.topRight,
          padding: const EdgeInsets.all(4),
          margin: const EdgeInsets.fromLTRB(0, 4, 4, 4),
          decoration: BoxDecoration(
            color: animeGuide.boxColor,
            borderRadius: const BorderRadius.all(
              Radius.circular(2),
            ),
          ),
          child: Text(
            animeGuide.ageGuide,
            style: const TextStyle(
              color: Colors.white,
              fontSize: 10,
            ),
          ),
        ),
        const Text(
          '• Subtitled',
          style: TextStyle(
            fontSize: 12,
          ),
        ),
      ],
    );
  }
}
