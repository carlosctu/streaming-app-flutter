import 'package:features/home/bloc/home_bloc.dart';
import 'package:features/home/model/home_view_data.dart';
import 'package:features/home/widgets/home_cover_widget.dart';
import 'package:features/home/widgets/trending_animes/trending_anime_carousel.dart';
import 'package:flutter/material.dart';

class HomeBody extends StatelessWidget {
  final Map<AnimeTypes, HomeViewData> todo;
  const HomeBody({
    super.key,
    required this.todo,
  });

  @override
  Widget build(BuildContext context) {
    final animes = todo[AnimeTypes.shounen]!.data;

    return SingleChildScrollView(
      child: Column(
        children: [
          HomeCoverWidget(todo: todo[AnimeTypes.trending]!),
          TrendingAnimeCarousel(animes: todo[AnimeTypes.trending]!.data),
          TrendingAnimeCarousel(animes: todo[AnimeTypes.shounen]!.data),
          TrendingAnimeCarousel(animes: todo[AnimeTypes.newUpdates]!.data),
          TrendingAnimeCarousel(animes: todo[AnimeTypes.romance]!.data),
        ],
      ),
    );
  }
}
