import 'package:features/anime_page/widgets/anime_cover_image_widget.dart';
import 'package:features/anime_page/widgets/anime_description_widget.dart';
import 'package:features/anime_page/widgets/sliver_tabbar_delegate_widget.dart';
import 'package:features/home/model/anime_list_view_data.dart';
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

    print(widget.args.anime);

    return Scaffold(
      extendBodyBehindAppBar: true,
      body: SafeArea(
        top: false,
        child: NestedScrollView(
          physics: const ClampingScrollPhysics(),
          headerSliverBuilder: (BuildContext context, _) {
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
          body: const Padding(
            padding: EdgeInsets.all(16.0),
            child: Text('body'),
          ),
        ),
      ),
    );
  }
}
