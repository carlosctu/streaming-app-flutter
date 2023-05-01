import 'package:components/design_components.dart';
import 'package:features/home/model/anime_list_view_data.dart';
import 'package:features/shared/utils/expandable_text_widget.dart';
import 'package:flutter/material.dart';

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

  @override
  void initState() {
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
    print(scrollController.offset);
    print(scrollController.position);
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
    print(widget.args.anime);

    final anime = widget.args.anime;
    String title = anime.attributes?.canonicalTitle ?? '';

    return Scaffold(
      extendBodyBehindAppBar: true,
      body: SafeArea(
        top: false,
        child: NestedScrollView(
            // controller: scrollController,
            physics: const ClampingScrollPhysics(),
            headerSliverBuilder:
                (BuildContext context, bool innerBoxIsScrolled) {
              return [
                SliverOverlapAbsorber(
                  handle:
                      NestedScrollView.sliverOverlapAbsorberHandleFor(context),
                  sliver: const SliverAppBar(
                    floating: true,
                    snap: true,
                    pinned: true,
                    backgroundColor: Colors.black26,
                  ),
                ),
                SliverToBoxAdapter(
                  child: Hero(
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
                ),
                SliverPadding(
                  padding: const EdgeInsets.only(
                    left: 16,
                    right: 16,
                    top: 24,
                    bottom: 8,
                  ),
                  sliver: SliverToBoxAdapter(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          title,
                          style: const TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                        const SizedBox(height: 12),
                        ExpandableTextWidget(
                          text: anime.attributes?.synopsis?.split('(')[0],
                          trimLines: 4,
                        ),
                      ],
                    ),
                  ),
                ),
                SliverPersistentHeader(
                  pinned: false,
                  delegate: MySliverPersistentHeaderDelegate(
                    controller: tabController,
                  ),
                ),
              ];
            },
            body: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Text('body'),
            )),
      ),
    );
  }
}

class MySliverPersistentHeaderDelegate extends SliverPersistentHeaderDelegate {
  final TabController controller;
  MySliverPersistentHeaderDelegate({
    required this.controller,
  });
  @override
  Widget build(
      BuildContext context, double shrinkOffset, bool overlapsContent) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 16),
      decoration: BoxDecoration(
        border: Border(
          bottom: BorderSide(color: Colors.grey.shade400, width: 1.0),
        ),
      ),
      child: TabBar(
        isScrollable: true,
        controller: controller,
        labelColor: Colors.black,
        indicatorColor: const Color(0xffD93B41),
        tabs: const [
          Tab(text: 'Episodes'),
          Tab(text: 'Trailer'),
        ],
      ),
    );
  }

  @override
  double get maxExtent => 48;

  @override
  double get minExtent => 48;

  @override
  bool shouldRebuild(covariant SliverPersistentHeaderDelegate oldDelegate) {
    return false;
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
                spreadRadius: 4,
                blurRadius: 40,
              ),
            ],
          ),
        )
      ],
    );
  }
}
