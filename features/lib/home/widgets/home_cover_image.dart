import 'package:features/home/model/anime_attributes_view_data.dart';
import 'package:features/home/model/home_view_data.dart';
import 'package:flutter/material.dart';

class BackgroundImage extends StatelessWidget {
  final HomeViewData todo;
  const BackgroundImage({
    super.key,
    required this.todo,
  });

  @override
  Widget build(BuildContext context) {
    final anime = todo.data[3].attributes;
    return Container(
      padding: const EdgeInsets.only(
        top: kToolbarHeight,
      ),
      width: double.infinity,
      height: 400,
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
                  color: Colors.black.withOpacity(0.2),
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
                const SizedBox(height: 4),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class _AnimeInformation extends StatelessWidget {
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
            decoration: const BoxDecoration(
              color: Color(0xffD93B41),
              borderRadius: BorderRadius.all(
                Radius.circular(2),
              ),
            ),
            child: Text(
              '${anime?.ageRating}',
              style: const TextStyle(
                color: Colors.white,
                fontSize: 10,
              ),
            ),
          ),
        if (anime?.averageRating != null)
          Container(
            padding: const EdgeInsets.all(4),
            decoration: const BoxDecoration(
              color: Color(0xffD93B41),
              borderRadius: BorderRadius.all(
                Radius.circular(2),
              ),
            ),
            child: Text(
              'Rating: ${anime!.averageRating!.replaceAll('', '.').substring(1, 4)}',
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
  const _WatchNowButton();

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {},
      child: Container(
        padding: const EdgeInsets.all(6),
        decoration: const BoxDecoration(
          borderRadius: BorderRadius.all(
            Radius.circular(5),
          ),
          color: Color(0xffD93B41),
        ),
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
