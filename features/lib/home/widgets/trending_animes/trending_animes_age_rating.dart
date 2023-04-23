import 'package:features/home/model/anime_list_view_data.dart';
import 'package:features/home/widgets/config/trending_anime_age_rating_mixin.dart';
import 'package:flutter/material.dart';

class TrendingAnimeAgeRating extends StatelessWidget with AgeRatingMixin {
  final List<AnimeListViewData> animes;
  const TrendingAnimeAgeRating({
    super.key,
    required this.animes,
  });

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      shrinkWrap: true,
      physics: const ClampingScrollPhysics(),
      itemCount: animes.length,
      scrollDirection: Axis.horizontal,
      itemBuilder: (context, index) {
        String? ageRating = animes[index].attributes?.ageRating;

        return Container(
          margin: const EdgeInsets.only(right: 12),
          constraints: const BoxConstraints(
            maxWidth: 150,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                height: 200,
                decoration: BoxDecoration(
                  image: DecorationImage(
                    fit: BoxFit.fitWidth,
                    image: NetworkImage(
                      animes[index].attributes!.posterImage!.small!,
                    ),
                  ),
                ),
              ),
              Container(
                width: double.infinity,
                padding: const EdgeInsets.only(
                  bottom: 6,
                  left: 6,
                  top: 2,
                ),
                decoration: BoxDecoration(
                  borderRadius: const BorderRadius.only(
                    bottomLeft: Radius.circular(6),
                    bottomRight: Radius.circular(6),
                  ),
                  gradient: LinearGradient(
                    colors: [
                      Colors.transparent,
                      Colors.black.withOpacity(0.2),
                    ],
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                  ),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.8),
                    ),
                  ],
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const SizedBox(height: 4),
                    Text(
                      getFormattedTitle(
                          animes[index].attributes?.canonicalTitle),
                      style: const TextStyle(
                        color: Colors.white,
                      ),
                    ),
                    const SizedBox(height: 4),
                    Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Container(
                          padding: const EdgeInsets.all(4),
                          margin: const EdgeInsets.only(right: 4),
                          decoration: BoxDecoration(
                            color: getAgeGuide(ageRating).boxColor,
                            borderRadius: const BorderRadius.all(
                              Radius.circular(2),
                            ),
                          ),
                          child: Text(
                            getAgeGuide(ageRating).ageGuide,
                            style: const TextStyle(
                              color: Colors.white,
                              fontSize: 10,
                            ),
                          ),
                        ),
                        if (ageRating != null)
                          Container(
                            padding: const EdgeInsets.all(4),
                            decoration: BoxDecoration(
                              color: getAgeGuide(ageRating).boxColor,
                              borderRadius: const BorderRadius.all(
                                Radius.circular(2),
                              ),
                            ),
                            child: Row(
                              children: [
                                Text(
                                  ageRating,
                                  style: const TextStyle(
                                    color: Colors.white,
                                    fontSize: 10,
                                  ),
                                ),
                              ],
                            ),
                          ),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
