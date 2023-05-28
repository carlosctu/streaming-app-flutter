import 'package:components/design_components.dart';
import 'package:features/anime_page/bloc/anime_page_bloc.dart';
import 'package:features/anime_page/bloc/anime_page_event.dart';
import 'package:features/anime_page/bloc/anime_page_state.dart';
import 'package:features/anime_page/widgets/anime_cover_image_widget.dart';
import 'package:features/anime_page/widgets/anime_description_widget.dart';
import 'package:features/anime_page/widgets/anime_episodes_list_container_widget.dart';
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

class _AnimePageState extends State<AnimePage> with TickerProviderStateMixin {
  final titleKey = GlobalKey();
  late ScrollController scrollController;
  late TabController tabController;
  late Animation<double> animatedColor;
  late Animation<Offset> position;
  late AnimationController appbarController;

  AnimePageBloc get animePageBloc => context.read<AnimePageBloc>();

  @override
  void initState() {
    animePageBloc.add(
      AnimePageEventFetchAnimeInfo(animeId: widget.args.anime.id!),
    );
    scrollController = ScrollController();
    tabController = TabController(
      length: 2,
      vsync: this,
    );
    _appBarTitleAnimation();
    scrollController.addListener(_scrollListener);
    super.initState();
  }

  void _appBarTitleAnimation() {
    appbarController = AnimationController(
      duration: const Duration(milliseconds: 150),
      vsync: this,
    );

    animatedColor = Tween<double>(
      begin: 0,
      end: 0.95,
    ).animate(appbarController);

    position = Tween<Offset>(
      begin: const Offset(0.0, 4),
      end: Offset.zero,
    ).animate(
      CurvedAnimation(
        parent: appbarController,
        curve: Curves.linearToEaseOut,
      ),
    );
  }

  void _scrollListener() {
    const bottomOffset = 64;
    final coverImageHeight = (widget.args.anime.attributes?.posterImage
                ?.imageInfo?.dimensions?.medium?.height
                ?.toDouble() ??
            550) -
        bottomOffset;

    if (scrollController.offset > coverImageHeight) {
      appbarController.forward();
    } else if (scrollController.offset <= coverImageHeight) {
      appbarController.reverse();
    }
  }

  @override
  void dispose() {
    appbarController.dispose();
    scrollController.dispose();
    scrollController.removeListener(_scrollListener);
    super.dispose();
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
              controller: scrollController,
              physics: const ClampingScrollPhysics(),
              headerSliverBuilder: (BuildContext context, _) {
                return [
                  SliverOverlapAbsorber(
                    handle: NestedScrollView.sliverOverlapAbsorberHandleFor(
                      context,
                    ),
                    sliver: SliverAppBar(
                      floating: true,
                      snap: true,
                      pinned: true,
                      flexibleSpace: AnimatedBuilder(
                        animation: appbarController,
                        builder: (BuildContext context, Widget? child) {
                          return Container(
                            color: Colors.black.withOpacity(
                              animatedColor.value,
                            ),
                          );
                        },
                      ),
                      backgroundColor: Colors.transparent,
                      centerTitle: true,
                      title: SlideTransition(
                        position: position,
                        child: Text(
                          anime.attributes?.canonicalTitle ?? '',
                          style: const TextStyle(
                            fontSize: 18,
                          ),
                        ),
                      ),
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
                  SliverPadding(
                    padding: EdgeInsets.zero,
                    sliver: SliverPersistentHeader(
                      pinned: false,
                      delegate: SliverTabbarDelegateWidget(
                        controller: tabController,
                      ),
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
                      return const ProgressLoader();
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
