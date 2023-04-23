import 'package:features/home/model/anime_list_view_data.dart';
import 'package:features/home/widgets/trending_animes/trending_animes_age_rating.dart';
import 'package:flutter/material.dart';

class TrendingAnimeCarousel extends StatelessWidget {
  final List<AnimeListViewData> animes;
  const TrendingAnimeCarousel({
    super.key,
    required this.animes,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(12),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            'Trending Animes',
            style: TextStyle(
              color: Colors.black,
              fontSize: 18,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 8),
          SizedBox(
            height: 300,
            width: double.infinity,
            child: TrendingAnimeAgeRating(animes: animes),
          ),
        ],
      ),
    );
  }
}
