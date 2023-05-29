import 'package:components/design_components.dart';
import 'package:features/home/model/anime_list_view_data.dart';
import 'package:flutter/material.dart';

class AnimeCoverImageWidget extends StatelessWidget {
  final AnimeViewData anime;
  const AnimeCoverImageWidget({
    super.key,
    required this.anime,
  });

  @override
  Widget build(BuildContext context) {
    return Hero(
      tag: 'HeroCoverImage${anime.id}',
      placeholderBuilder: (context, heroSize, child) {
        return const ShimmerEffect(
          height: 150,
          width: 150,
        );
      },
      child: Image.network(
        anime.attributes!.posterImage!.original!,
        fit: BoxFit.fill,
        loadingBuilder: (context, child, loadingProgress) {
          return Container(
            child: loadingProgress == null
                ? _AnimeCoverImage(
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
    );
  }
}

class _AnimeCoverImage extends StatelessWidget {
  final AnimeViewData anime;
  final Widget child;
  const _AnimeCoverImage({
    required this.anime,
    required this.child,
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: AlignmentDirectional.bottomCenter,
      children: [
        _buildAnimeCoverImage(context),
        _buildShadowContainer(),
      ],
    );
  }

  Widget _buildAnimeCoverImage(BuildContext context) {
    return SizedBox(
      height: anime
          .attributes?.posterImage?.imageInfo?.dimensions?.medium?.height
          ?.toDouble(),
      width: MediaQuery.of(context).size.width,
      child: child,
    );
  }

  Widget _buildShadowContainer() {
    return Container(
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
            spreadRadius: 4,
            blurRadius: 40,
          ),
        ],
      ),
    );
  }
}
