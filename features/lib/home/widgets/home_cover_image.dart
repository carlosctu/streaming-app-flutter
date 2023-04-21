import 'package:features/home/model/home_view_data.dart';
import 'package:flutter/material.dart';

class HomeCoverImage extends StatelessWidget {
  final HomeViewData todo;
  const HomeCoverImage({
    super.key,
    required this.todo,
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.topRight,
      children: [
        _BackgroundImage(todo: todo),
        const _ImageShadow(),
        const _CloseButton(),
      ],
    );
  }
}

class _BackgroundImage extends StatelessWidget {
  const _BackgroundImage({
    required this.todo,
  });

  final HomeViewData todo;

  @override
  Widget build(BuildContext context) {
    final anime = todo.data[3].attributes;
    return Container(
      padding: const EdgeInsets.only(
        top: kToolbarHeight,
      ),
      width: double.infinity,
      height: 400,
      decoration: BoxDecoration(
        image: DecorationImage(
          image: NetworkImage('${anime?.posterImage?.original}'),
          fit: BoxFit.fitWidth,
          alignment: const Alignment(0, -0.25),
        ),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          Container(
            padding: const EdgeInsets.all(8),
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: [
                  Colors.transparent,
                  Colors.black.withOpacity(0.5),
                ],
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
              ),
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(0.2),
                  spreadRadius: 10,
                  blurRadius: 10,
                ),
              ],
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  '${anime?.canonicalTitle}',
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 6),
                Wrap(
                  spacing: 8,
                  children: [
                    if (anime?.ageRating != null)
                      Container(
                        padding: const EdgeInsets.all(4),
                        decoration: const BoxDecoration(
                          color: Color(0xffD93B41),
                        ),
                        child: Text(
                          '${anime?.ageRating}',
                          style: const TextStyle(
                            color: Colors.white,
                            fontSize: 10,
                          ),
                        ),
                      ),
                    if (anime?.averageRating != null)
                      Container(
                        padding: const EdgeInsets.all(4),
                        decoration: const BoxDecoration(
                          color: Color(0xffD93B41),
                        ),
                        child: Text(
                          'Rating: ${anime!.averageRating!.replaceAll('', '.').substring(1, 4)}',
                          style: const TextStyle(
                            color: Colors.white,
                            fontSize: 10,
                          ),
                        ),
                      ),
                  ],
                ),
                const SizedBox(height: 6),
                Text(
                  '${anime?.description?.replaceAll('\n', ' ').substring(0, 120)}...',
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 12.5,
                  ),
                ),
                const SizedBox(height: 6),
                GestureDetector(
                  onTap: () {},
                  child: Container(
                    padding: const EdgeInsets.all(6),
                    decoration: const BoxDecoration(
                      borderRadius: BorderRadius.all(
                        Radius.circular(5),
                      ),
                      color: Color(0xffD93B41),
                    ),
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: const [
                        Text(
                          'Watch now',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 12.5,
                          ),
                        ),
                        Icon(
                          Icons.play_arrow,
                          size: 16,
                          color: Colors.white,
                        )
                      ],
                    ),
                  ),
                ),
              
              ],
            ),
          ),
        ],
      ),
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
