import 'package:features/home/model/anime_list_view_data.dart';
import 'package:flutter/material.dart';

class AnimeAgeRating extends StatelessWidget {
  final List<AnimeListViewData> animes;
  const AnimeAgeRating({
    super.key,
    required this.animes,
  });

  @override
  Widget build(BuildContext context) {
    String getFormattedTitle(String? title) {
      if (title == null) return '';
      if (title.length < 19) return title;
      return '${title.substring(0, 18)}...';
    }

    return ListView.builder(
      shrinkWrap: true,
      physics: const ClampingScrollPhysics(),
      itemCount: animes.length,
      scrollDirection: Axis.horizontal,
      itemBuilder: (context, index) {
        String? ageRating = animes[index].attributes?.ageRating;

        String getAgeGuide() {
          switch (ageRating) {
            case 'PG':
              return 'A13';
            case 'R':
              return 'A17';
            default:
              return 'G';
          }
        }

        return Container(
          margin: const EdgeInsets.only(right: 12),
          constraints: const BoxConstraints(
            maxWidth: 150,
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                height: 200,
                decoration: BoxDecoration(
                  image: DecorationImage(
                    fit: BoxFit.fitWidth,
                    image: NetworkImage(
                      animes[index].attributes!.posterImage!.small!,
                    ),
                  ),
                ),
              ),
              Text(getFormattedTitle(animes[index].attributes?.canonicalTitle)),
              Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Container(
                    padding: const EdgeInsets.all(4),
                    margin: const EdgeInsets.only(right: 4),
                    decoration: const BoxDecoration(
                      color: Color(0xffD93B41),
                      borderRadius: BorderRadius.all(
                        Radius.circular(2),
                      ),
                    ),
                    child: Text(
                      getAgeGuide(),
                      style: const TextStyle(
                        color: Colors.white,
                        fontSize: 10,
                      ),
                    ),
                  ),
                  if (ageRating != null)
                    Container(
                      padding: const EdgeInsets.all(4),
                      decoration: const BoxDecoration(
                        color: Color(0xffD93B41),
                        borderRadius: BorderRadius.all(
                          Radius.circular(2),
                        ),
                      ),
                      child: Row(
                        children: [
                          Text(
                            ageRating,
                            style: const TextStyle(
                              color: Colors.white,
                              fontSize: 10,
                            ),
                          ),
                        ],
                      ),
                    ),
                ],
              ),
            ],
          ),
        );
      },
    );
  }
}
