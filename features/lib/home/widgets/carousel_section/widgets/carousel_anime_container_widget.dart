import 'package:components/design_components.dart';
import 'package:features/anime_page/anime_page.dart';
import 'package:features/home/model/anime_list_view_data.dart';
import 'package:features/home/widgets/config/anime_rating_config.dart';
import 'package:features/home/widgets/config/trending_anime_age_rating_mixin.dart';
import 'package:flutter/material.dart';

class AnimeContainerWidget extends StatelessWidget with AgeRatingMixin {
  final String index;
  final AnimeViewData anime;
  final Widget child;
  const AnimeContainerWidget({
    Key? key,
    required this.index,
    required this.anime,
    required this.child,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    String? ageRating = anime.attributes?.ageRating;
    AnimeRatingConfig animeRatingconfig = getAgeGuide(ageRating);
    final titleDescription =
        getFormattedTitle(anime.attributes?.canonicalTitle);

    return GestureDetector(
      onTap: () => Navigator.pushNamed(
        context,
        AnimePage.name,
        arguments: AnimePageArguments(
          anime: anime,
        ),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          _AnimeContainerImage(
            index: index,
            animeRatingconfig: animeRatingconfig,
            child: child,
          ),
          _AnimeContainerDescription(titleDescription: titleDescription),
        ],
      ),
    );
  }
}

class _AnimeContainerImage extends StatelessWidget {
  final String index;
  final Widget child;
  final AnimeRatingConfig animeRatingconfig;
  const _AnimeContainerImage({
    Key? key,
    required this.index,
    required this.child,
    required this.animeRatingconfig,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        // Hero(
        // tag: 'HeroCoverImage$index',
        // placeholderBuilder: (context, heroSize, child) {
        // return const ShimmerEffect(
        //   height: 150,
        //   width: 150,
        // );
        // },
        // child:
        SizedBox(
          height: 200,
          width: 200,
          child: child,
        ),
        // ),
        Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Container(
              alignment: Alignment.topRight,
              padding: const EdgeInsets.all(4),
              margin: const EdgeInsets.all(4),
              decoration: BoxDecoration(
                color: animeRatingconfig.boxColor,
                borderRadius: const BorderRadius.all(
                  Radius.circular(2),
                ),
              ),
              child: Text(
                animeRatingconfig.ageGuide,
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 10,
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }
}

class _AnimeContainerDescription extends StatelessWidget {
  final String titleDescription;
  const _AnimeContainerDescription({
    required this.titleDescription,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
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
            titleDescription,
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
    );
  }
}
