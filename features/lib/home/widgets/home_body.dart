import 'package:features/home/model/home_view_data.dart';
import 'package:features/home/widgets/home_cover_widget.dart';
import 'package:features/home/widgets/trending_animes/trending_anime_carousel.dart';
import 'package:flutter/material.dart';

class HomeBody extends StatelessWidget {
  final HomeViewData todo;
  const HomeBody({
    super.key,
    required this.todo,
  });

  @override
  Widget build(BuildContext context) {
    final animes = todo.data;

    return SingleChildScrollView(
      child: Column(
        children: [
          HomeCoverWidget(todo: todo),
          TrendingAnimeCarousel(animes: animes)
        ],
      ),
    );
  }
}
