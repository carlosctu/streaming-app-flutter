import 'package:components/design_components.dart';
import 'package:features/anime_page/repository/model/get_anime_episode_info_response.dart';
import 'package:flutter/material.dart';

class EpisodesListContainerWidget extends StatelessWidget {
  final List<GetAnimeEpisodeInfoResponse> data;
  const EpisodesListContainerWidget({
    super.key,
    required this.data,
  });

  @override
  Widget build(BuildContext context) {
    return MediaQuery.removePadding(
      removeTop: true,
      context: context,
      child: SingleChildScrollView(
        physics: const ClampingScrollPhysics(),
        padding: const EdgeInsets.symmetric(
          horizontal: 12,
          vertical: 24,
        ),
        child: ListView.separated(
          physics: const NeverScrollableScrollPhysics(),
          shrinkWrap: true,
          itemCount: data.length,
          separatorBuilder: (context, index) => const SizedBox(height: 24),
          itemBuilder: (context, index) {
            final episode = data[index].data;
            return Row(
              children: [
                if (episode.attributes.thumbnail?.original != null) ...[
                  _EpisodeImageContainer(episode: episode),
                  _EpisodeInformationContainer(episode: episode),
                ],
              ],
            );
          },
        ),
      ),
    );
  }
}

class _EpisodeImageContainer extends StatelessWidget {
  final EpisodeInfoResponse episode;
  const _EpisodeImageContainer({
    Key? key,
    required this.episode,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Image.network(
      episode.attributes.thumbnail!.original!,
      fit: BoxFit.fill,
      loadingBuilder: (context, child, loadingProgress) {
        return Container(
          margin: const EdgeInsets.only(right: 12),
          height: 90,
          width: 160,
          child: loadingProgress == null
              ? Container(
                  child: child,
                )
              : ShimmerEffect(
                  height: 500,
                  width: MediaQuery.of(context).size.width,
                ),
        );
      },
    );
  }
}

class _EpisodeInformationContainer extends StatelessWidget {
  final EpisodeInfoResponse episode;
  const _EpisodeInformationContainer({
    Key? key,
    required this.episode,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Flexible(
      child: ConstrainedBox(
        constraints: const BoxConstraints(
          maxHeight: 90,
        ),
        child: _buildEpisodeDescription(episode.attributes.canonicalTitle,
            episode.attributes.description, context),
      ),
    );
  }

  Widget _buildEpisodeDescription(
    String? title,
    String? description,
    BuildContext context,
  ) {
    final maxHeight = MediaQuery.of(context).size.height;
    int maxLength = maxHeight < 680 ? 100 : 140;
    title ??= '';

    if (title.length > 30) {
      return Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            '${title.replaceAll('\n', ' ').substring(0, 30)}...',
            style: const TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.w600,
            ),
          ),
          _buildEpisodeSynopsis(description, maxLength - title.length)
        ],
      );
    }
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: const TextStyle(
            fontSize: 14,
            fontWeight: FontWeight.w600,
          ),
        ),
        _buildEpisodeSynopsis(description, maxLength - title.length)
      ],
    );
  }

  Widget _buildEpisodeSynopsis(String? description, int maxLength) {
    if (description == null) return const SizedBox.shrink();
    if (description.length > maxLength) {
      return Text(
        '${description.replaceAll('\n', ' ').substring(0, maxLength)}...',
        style: const TextStyle(
          fontSize: 12,
        ),
      );
    }
    return Text(description);
  }
}
