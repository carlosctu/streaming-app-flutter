import 'package:features/home/bloc/home_bloc.dart';
import 'package:features/home/model/home_view_data.dart';
import 'package:features/home/widgets/home_cover_widget.dart';
import 'package:features/home/widgets/carousel_section/carousel_section.dart';
import 'package:flutter/material.dart';

class HomeBody extends StatelessWidget {
  final Map<AnimeTypes, HomeViewData> todo;
  const HomeBody({
    super.key,
    required this.todo,
  });

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      top: false,
      child: CustomScrollView(
        physics: const BouncingScrollPhysics(),
        slivers: [
          SliverAppBar(
            pinned: false,
            floating: false,
            automaticallyImplyLeading: false,
            expandedHeight: 350,
            collapsedHeight: kToolbarHeight + 60,
            backgroundColor: Colors.transparent,
            flexibleSpace: HomeCoverWidget(todo: todo[AnimeTypes.trending]!),
          ),
          CarouselSection(
            animes: todo[AnimeTypes.trending]!.data,
            sectionTitle: 'Trending series',
          ),
          CarouselSection(
            animes: todo[AnimeTypes.shounen]!.data,
            sectionTitle: 'Recently updated',
          ),
          CarouselSection(
            animes: todo[AnimeTypes.romance]!.data,
            sectionTitle: 'Romance checkpoint',
          ),
          CarouselSection(
            animes: todo[AnimeTypes.newUpdates]!.data,
            sectionTitle: 'Shounen series',
          ),
        ],
      ),
    );
  }
}
