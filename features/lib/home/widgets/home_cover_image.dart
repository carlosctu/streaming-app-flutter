import 'package:features/home/model/anime_attributes_view_data.dart';
import 'package:features/home/model/home_view_data.dart';
import 'package:features/home/widgets/config/trending_anime_age_rating_mixin.dart';
import 'package:flutter/material.dart';

class BackgroundImage extends StatelessWidget {
  final HomeViewData todo;
  const BackgroundImage({
    Key? key,
    required this.todo,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final anime = todo.data[1].attributes;
    return Container(
      // padding: const EdgeInsets.only(
      //   top: kToolbarHeight,
      // ),
      width: double.infinity,
      decoration: BoxDecoration(
        image: DecorationImage(
          image: NetworkImage('${anime?.posterImage?.original}'),
          fit: BoxFit.fitWidth,
          alignment: const Alignment(0, -0.25),
        ),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          Container(
            padding: const EdgeInsets.all(8),
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: [
                  Colors.transparent,
                  Colors.black.withOpacity(0.5),
                ],
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
              ),
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(0.4),
                  spreadRadius: 10,
                  blurRadius: 10,
                ),
              ],
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  '${anime?.canonicalTitle}',
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 6),
                _AnimeInformation(anime: anime),
                const SizedBox(height: 6),
                Text(
                  '${anime?.description?.replaceAll('\n', ' ').substring(0, 120)}...',
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 12.5,
                  ),
                ),
                const SizedBox(height: 6),
                const _WatchNowButton(),
                // const SizedBox(height: 4),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class _AnimeInformation extends StatelessWidget with AgeRatingMixin {
  final AnimeAttributesViewData? anime;
  const _AnimeInformation({
    required this.anime,
  });

  @override
  Widget build(BuildContext context) {
    return Wrap(
      spacing: 8,
      crossAxisAlignment: WrapCrossAlignment.center,
      children: [
        if (anime?.ageRating != null)
          Container(
            padding: const EdgeInsets.all(4),
            decoration: BoxDecoration(
              color: getAgeGuide(anime?.ageRating).boxColor,
              borderRadius: const BorderRadius.all(
                Radius.circular(2),
              ),
            ),
            child: Text(
              getAgeGuide(anime?.ageRating).ageGuide,
              style: const TextStyle(
                color: Colors.white,
                fontSize: 10,
              ),
            ),
          ),
        Text(
          '• ${anime?.episodeLength} Episodes',
          style: const TextStyle(
            color: Colors.white,
            fontSize: 12,
          ),
        ),
      ],
    );
  }
}

class _WatchNowButton extends StatelessWidget {
  const _WatchNowButton({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(6),
      decoration: const BoxDecoration(
        borderRadius: BorderRadius.all(
          Radius.circular(5),
        ),
        color: Color(0xffD93B41),
      ),
      child: Flexible(
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: const [
            Icon(
              Icons.play_arrow_sharp,
              size: 16,
              color: Colors.white,
            ),
            SizedBox(width: 4),
            Text(
              'Watch now',
              style: TextStyle(
                color: Colors.white,
                fontSize: 12.5,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
