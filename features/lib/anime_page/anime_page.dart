import 'package:components/design_components.dart';
import 'package:features/anime_page/bloc/anime_page_bloc.dart';
import 'package:features/anime_page/bloc/anime_page_event.dart';
import 'package:features/anime_page/bloc/anime_page_state.dart';
import 'package:features/anime_page/repository/anime_page_repository.dart';
import 'package:features/anime_page/repository/model/get_anime_episode_info_response.dart';
import 'package:features/anime_page/widgets/anime_cover_image_widget.dart';
import 'package:features/anime_page/widgets/anime_description_widget.dart';
import 'package:features/anime_page/widgets/sliver_tabbar_delegate_widget.dart';
import 'package:features/home/model/anime_list_view_data.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AnimePageArguments {
  final AnimeViewData anime;
  AnimePageArguments({
    required this.anime,
  });
}

class AnimePage extends StatefulWidget {
  final AnimePageArguments args;
  const AnimePage({
    Key? key,
    required this.args,
  }) : super(key: key);

  static const name = "/anime";

  @override
  State<AnimePage> createState() => _AnimePageState();
}

class _AnimePageState extends State<AnimePage>
    with SingleTickerProviderStateMixin {
  final titleKey = GlobalKey();
  late ScrollController scrollController;
  late TabController tabController;
  bool _showTitle = false;

  AnimePageBloc get animePageBloc => context.read<AnimePageBloc>();

  @override
  void initState() {
    animePageBloc.add(
      AnimePageEventFetchAnimeInfo(
        animeId: widget.args.anime.id!,
      ),
    );
    scrollController = ScrollController();
    tabController = TabController(
      length: 2,
      vsync: this,
    );
    scrollController.addListener(_scrollListener);
    super.initState();
  }

  @override
  void dispose() {
    scrollController.dispose();
    super.dispose();
  }

  void _scrollListener() {
    if (scrollController.offset > 0 && !_showTitle) {
      setState(() {
        _showTitle = true;
      });
    } else if (scrollController.offset <= 0 && _showTitle) {
      setState(() {
        _showTitle = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    final anime = widget.args.anime;

    return Scaffold(
      extendBodyBehindAppBar: true,
      body: BlocBuilder<AnimePageBloc, AnimePageState>(
        builder: (context, state) {
          return SafeArea(
            top: false,
            child: NestedScrollView(
              physics: const ClampingScrollPhysics(),
              headerSliverBuilder: (BuildContext context, _) {
                return [
                  SliverOverlapAbsorber(
                    handle: NestedScrollView.sliverOverlapAbsorberHandleFor(
                        context),
                    sliver: const SliverAppBar(
                      floating: true,
                      snap: true,
                      pinned: true,
                      backgroundColor: Colors.black26,
                    ),
                  ),
                  SliverToBoxAdapter(
                    child: AnimeCoverImageWidget(anime: anime),
                  ),
                  SliverPadding(
                    padding: const EdgeInsets.fromLTRB(16, 24, 16, 8),
                    sliver: SliverToBoxAdapter(
                      child: AnimeDescriptionWidget(anime: anime),
                    ),
                  ),
                  SliverPersistentHeader(
                    pinned: false,
                    delegate: SliverTabbarDelegateWidget(
                      controller: tabController,
                    ),
                  ),
                ];
              },
              body: StreamBuilder(
                stream: animePageBloc.stream,
                builder: (context, snapshot) {
                  final state = snapshot.data?.status;
                  switch (state) {
                    case AnimePageStatus.valid:
                      return EpisodesListContainerWidget(
                        data: snapshot.data!.data,
                      );
                    case AnimePageStatus.loading:
                      return const Center(
                        child: CircularProgressIndicator(),
                      );
                    case AnimePageStatus.invalid:
                    default:
                      return const Center(
                        child: Text('Error to fetch data.'),
                      );
                  }
                },
              ),
            ),
          );
        },
      ),
    );
  }
}

class EpisodesListContainerWidget extends StatelessWidget {
  final List<GetAnimeEpisodeInfoResponse> data;
  const EpisodesListContainerWidget({
    super.key,
    required this.data,
  });

  @override
  Widget build(BuildContext context) {
    Widget getEpisodeDescription(String? description) {
      if (description == null) return const SizedBox.shrink();
      if (description.length > 120) {
        return Text(
          '${description.replaceAll('\n', ' ').substring(0, 120)}...',
          style: const TextStyle(
            fontSize: 12,
          ),
        );
      }
      return Text(description);
    }

    return MediaQuery.removePadding(
      removeTop: true,
      context: context,
      child: SingleChildScrollView(
        physics: const ClampingScrollPhysics(),
        padding: const EdgeInsets.symmetric(
          horizontal: 12,
          vertical: 24,
        ),
        child: Column(
          children: [
            ListView.separated(
              physics: const NeverScrollableScrollPhysics(),
              shrinkWrap: true,
              itemCount: data.length,
              separatorBuilder: (context, index) => const SizedBox(height: 24),
              itemBuilder: (context, index) {
                final episode = data[index].data;
                return Row(
                  children: [
                    if (episode.attributes.thumbnail?.original != null)
                      Image.network(
                        episode.attributes.thumbnail!.original!,
                        fit: BoxFit.fill,
                        loadingBuilder: (context, child, loadingProgress) {
                          return SizedBox(
                            height: 90,
                            width: 160,
                            child: loadingProgress == null
                                ? Container(
                                    margin: const EdgeInsets.only(right: 12),
                                    child: child,
                                  )
                                : ShimmerEffect(
                                    height: 500,
                                    width: MediaQuery.of(context).size.width,
                                  ),
                          );
                        },
                      ),
                    Flexible(
                      child: ConstrainedBox(
                        constraints: const BoxConstraints(
                          maxHeight: 90,
                        ),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              episode.attributes.canonicalTitle ?? '',
                              style: const TextStyle(
                                fontSize: 14,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                            getEpisodeDescription(
                                episode.attributes.description)
                          ],
                        ),
                      ),
                    )
                  ],
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
