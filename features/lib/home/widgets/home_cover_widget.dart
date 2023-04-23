import 'package:features/home/model/home_view_data.dart';
import 'package:features/home/widgets/home_cover_image.dart';
import 'package:flutter/material.dart';

class HomeCoverWidget extends StatelessWidget {
  final HomeViewData todo;
  const HomeCoverWidget({
    super.key,
    required this.todo,
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.topRight,
      children: [
        BackgroundImage(todo: todo),
        const _ImageShadow(),
        const _CloseButton(),
      ],
    );
  }
}

class _CloseButton extends StatelessWidget {
  const _CloseButton();

  @override
  Widget build(BuildContext context) {
    return IconButton(
      padding: const EdgeInsets.only(top: kToolbarHeight - 5),
      splashRadius: 18,
      icon: const Icon(
        Icons.cancel_sharp,
        size: 24,
        color: Colors.white,
      ),
      onPressed: () => Navigator.pop(context),
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
