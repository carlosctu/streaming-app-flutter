import 'package:components/design_components.dart';
import 'package:features/home/model/anime_list_view_data.dart';
import 'package:features/home/widgets/carousel_section/widgets/carousel_anime_container_widget.dart';
import 'package:flutter/material.dart';

class CarouselAnimeListWidget extends StatelessWidget {
  final List<AnimeViewData> animes;
  const CarouselAnimeListWidget({
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
        AnimeViewData anime = animes[index];

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
                  ? AnimeContainerWidget(
                      anime: anime,
                      child: child,
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
