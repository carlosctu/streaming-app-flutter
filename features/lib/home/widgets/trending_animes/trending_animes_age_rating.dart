import 'package:components/design_components.dart';
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
      physics: const BouncingScrollPhysics(),
      itemCount: animes.length,
      scrollDirection: Axis.horizontal,
      itemBuilder: (context, index) {
        String? ageRating = animes[index].attributes?.ageRating;

        return Image.network(
          fit: BoxFit.fill,
          animes[index].attributes!.posterImage!.small!,
          loadingBuilder: (context, child, loadingProgress) {
            return Container(
              margin: const EdgeInsets.only(right: 12),
              constraints: const BoxConstraints(
                maxWidth: 150,
              ),
              child: loadingProgress == null
                  ? Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Stack(
                          children: [
                            SizedBox(
                              height: 200,
                              width: 200,
                              // decoration: BoxDecoration(
                              // border: Border(
                              //   top: BorderSide(
                              //     color: Colors.black.withOpacity(0.5),
                              //     width: 1,
                              //   ),
                              //   right: BorderSide(
                              //     color: Colors.black.withOpacity(0.5),
                              //     width: 1,
                              //   ),
                              //   left: BorderSide(
                              //     color: Colors.black.withOpacity(0.5),
                              //     width: 1,
                              //   ),
                              // ),
                              // ),
                              child: child,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: [
                                Container(
                                  alignment: Alignment.topRight,
                                  padding: const EdgeInsets.all(4),
                                  margin: const EdgeInsets.all(4),
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
                              ],
                            ),
                          ],
                        ),
                        Container(
                          width: double.infinity,
                          padding: const EdgeInsets.only(
                            bottom: 8,
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
                                children: const [
                                  Text(
                                    'Series',
                                    style: TextStyle(
                                      color: Color(0xff2ABCBB),
                                      fontSize: 12,
                                    ),
                                  ),
                                  Text(
                                    '• Sub | Dub',
                                    style: TextStyle(
                                      color: Color.fromARGB(255, 146, 146, 147),
                                      fontSize: 12,
                                    ),
                                  )
                                ],
                              ),
                            ],
                          ),
                        ),
                      ],
                    )
                  : const ShimmerEffect(
                      height: 150,
                      width: 150,
                    ),
            );
          },
        );
      },
    );
  }
}
