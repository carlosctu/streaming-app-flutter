import 'package:features/home/model/home_view_data.dart';
import 'package:features/home/widgets/home_cover_image.dart';
import 'package:flutter/material.dart';

class HomeCoverWidget extends StatelessWidget {
  final HomeViewData data;
  const HomeCoverWidget({
    super.key,
    required this.data,
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.topRight,
      children: [
        BackgroundImage(data: data),
        const _ImageShadow(),
      ],
    );
  }
}

class _ImageShadow extends StatelessWidget {
  const _ImageShadow();

  @override
  Widget build(BuildContext context) {
    return Container(
      height: kToolbarHeight + 45,
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.bottomCenter,
          end: Alignment.topCenter,
          colors: [
            Colors.transparent,
            Colors.black.withOpacity(0.7),
          ],
        ),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.5),
            spreadRadius: 5,
            blurRadius: 60,
          ),
        ],
      ),
    );
  }
}
