import 'package:features/home/widgets/config/anime_rating_config.dart';
import 'package:flutter/material.dart';

class AgeRatingMixin {
  String getFormattedTitle(String? title) {
    if (title == null) return '';
    if (title.length < 17) return title;
    return '${title.substring(0, 16)}...';
  }

  AnimeGuideConfig getAgeGuide(String? ageRating) {
    switch (ageRating) {
      case 'PG':
        return AnimeGuideConfig(
          ageGuide: 'A13',
          boxColor: const Color(0xfff58220),
        );
      case 'R':
        return AnimeGuideConfig(
          ageGuide: 'A17',
          boxColor: const Color(0xffD93B41),
        );
      default:
        return AnimeGuideConfig(
          ageGuide: 'G',
          boxColor: const Color(0xff04A188),
        );
    }
  }
}
