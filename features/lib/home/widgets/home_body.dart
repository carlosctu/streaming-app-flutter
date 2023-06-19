import 'package:features/home/bloc/home_bloc.dart';
import 'package:features/home/model/home_view_data.dart';
import 'package:features/home/widgets/home_cover_widget.dart';
import 'package:features/home/widgets/carousel_section/carousel_section.dart';
import 'package:flutter/material.dart';

class HomeBody extends StatelessWidget {
  final Map<AnimeTypes, HomeViewData> data;
  const HomeBody({
    super.key,
    required this.data,
  });

  @override
  Widget build(BuildContext context) {
    final maxHeight = MediaQuery.of(context).size.height;
    return SafeArea(
      top: false,
      child: CustomScrollView(
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
            padding: const EdgeInsets.only(top: 12),
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
      ),
    );
  }
}
