import 'package:features/home/model/anime_list_view_data.dart';
import 'package:features/home/widgets/trending_animes/trending_animes_age_rating.dart';
import 'package:flutter/material.dart';

class TrendingAnimeCarousel extends StatelessWidget {
  final List<AnimeListViewData> animes;
  final String sectionTitle;
  const TrendingAnimeCarousel({
    super.key,
    required this.animes,
    required this.sectionTitle,
  });

  @override
  Widget build(BuildContext context) {
    return SliverToBoxAdapter(
      child: Padding(
        padding: const EdgeInsets.fromLTRB(12, 12, 12, 0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              sectionTitle,
              style: const TextStyle(
                color: Colors.black,
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 12),
            SizedBox(
              height: 260,
              width: double.infinity,
              child: TrendingAnimeAgeRating(animes: animes),
            ),
          ],
        ),
      ),
    );
  }
}
