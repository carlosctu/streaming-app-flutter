import 'package:features/home/bloc/home_bloc.dart';
import 'package:features/home/model/home_view_data.dart';
import 'package:features/home/widgets/carousel_section/carousel_section.dart';
import 'package:features/home/widgets/floating_bottom_app_bar/floating_bottom_app_bar.dart';
import 'package:features/home/widgets/home_cover_widget.dart';
import 'package:features/user_page/user_page.dart';
import 'package:flutter/material.dart';

class HomeBody extends StatefulWidget {
  final Map<AnimeTypes, HomeViewData> data;
  const HomeBody({
    super.key,
    required this.data,
  });

  @override
  State<HomeBody> createState() => _HomeBodyState();
}

class _HomeBodyState extends State<HomeBody> {
  late PageController _pageController;

  @override
  void initState() {
    _pageController = PageController(
      initialPage: 1,
    );
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      top: false,
      child: Stack(
        children: [
          PageView(
            physics: const NeverScrollableScrollPhysics(),
            controller: _pageController,
            children: [
              const Center(
                child: Text('Search Page'),
              ),
              AnimeHomePage(data: widget.data),
              const UserPage(),
            ],
          ),
          FloatingBottomAppBar(
            controller: _pageController,
          ),
        ],
      ),
    );
  }
}

class AnimeHomePage extends StatelessWidget {
  final Map<AnimeTypes, HomeViewData> data;

  const AnimeHomePage({super.key, required this.data});

  @override
  Widget build(BuildContext context) {
    final maxHeight = MediaQuery.of(context).size.height;

    return CustomScrollView(
      physics: const BouncingScrollPhysics(),
      slivers: [
        SliverAppBar(
          pinned: false,
          floating: false,
          automaticallyImplyLeading: false,
          expandedHeight: maxHeight < 680 ? 350 : 420,
          collapsedHeight: kToolbarHeight + 80,
          backgroundColor: Colors.transparent,
          flexibleSpace: HomeCoverWidget(
            data: data[AnimeTypes.trending]!,
          ),
        ),
        SliverPadding(
          padding: const EdgeInsets.only(
            top: 12,
            bottom: 48,
          ),
          sliver: SliverList(
            delegate: SliverChildListDelegate(
              [
                CarouselSection(
                  animes: data[AnimeTypes.trending]!.data,
                  sectionTitle: 'Trending series',
                ),
                CarouselSection(
                  animes: data[AnimeTypes.shounen]!.data,
                  sectionTitle: 'Recently updated',
                ),
                CarouselSection(
                  animes: data[AnimeTypes.romance]!.data,
                  sectionTitle: 'Romance checkpoint',
                ),
                CarouselSection(
                  animes: data[AnimeTypes.newUpdates]!.data,
                  sectionTitle: 'Shounen series',
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
