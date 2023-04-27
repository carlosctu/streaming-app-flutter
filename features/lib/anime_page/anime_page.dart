import 'package:components/design_components.dart';
import 'package:features/home/model/anime_list_view_data.dart';
import 'package:features/home/widgets/carousel_section/widgets/carousel_anime_container_widget.dart';
import 'package:flutter/material.dart';

class AnimePageArguments {
  final AnimeViewData anime;
  AnimePageArguments({
    required this.anime,
  });
}

class AnimePage extends StatelessWidget {
  final AnimePageArguments args;
  const AnimePage({
    super.key,
    required this.args,
  });

  static const name = "/anime";

  @override
  Widget build(BuildContext context) {
    print(args.anime);
    final anime = args.anime;
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
      ),
      body: SafeArea(
        top: false,
        child: CustomScrollView(
          physics: const BouncingScrollPhysics(),
          slivers: [
            SliverToBoxAdapter(
              child: Image.network(
                anime.attributes!.posterImage!.original!,
                fit: BoxFit.fill,
                loadingBuilder: (context, child, loadingProgress) {
                  return Container(
                    child: loadingProgress == null
                        ? AnimeCoverImage(
                            anime: anime,
                            child: child,
                          )
                        : ShimmerEffect(
                            height: 500,
                            width: MediaQuery.of(context).size.width,
                          ),
                  );
                },
              ),
            ),
            SliverToBoxAdapter(
              child: Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 16,
                  vertical: 24,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      anime.attributes?.canonicalTitle ?? '',
                      style: const TextStyle(
                        color: Colors.black,
                        fontSize: 18,
                      ),
                    ),
                    const SizedBox(height: 12),
                    Text(
                      anime.attributes?.synopsis?.split('(')[0] ?? '',
                      style: const TextStyle(
                        color: Colors.black,
                        fontSize: 14,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class AnimeCoverImage extends StatelessWidget {
  final AnimeViewData anime;
  final Widget child;
  const AnimeCoverImage({
    super.key,
    required this.anime,
    required this.child,
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: AlignmentDirectional.bottomCenter,
      children: [
        SizedBox(
          height: anime
              .attributes?.posterImage?.imageInfo?.dimensions?.medium?.height
              ?.toDouble(),
          width: MediaQuery.of(context).size.width,
          child: child,
        ),
        Container(
          height: 80,
          decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: [
                Colors.transparent,
                Colors.black.withOpacity(0.9),
              ],
            ),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.7),
                spreadRadius: 5,
                blurRadius: 60,
              ),
            ],
          ),
        )
      ],
    );
  }
}
