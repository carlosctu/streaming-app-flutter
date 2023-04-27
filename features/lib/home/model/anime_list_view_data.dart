import 'package:equatable/equatable.dart';
import 'package:features/home/model/anime_attributes_view_data.dart';

class AnimeViewData extends Equatable {
  final String? id;
  final String? type;
  final LinkPathViewData? links;
  final AnimeAttributesViewData? attributes;
  const AnimeViewData({
    required this.id,
    required this.type,
    required this.links,
    required this.attributes,
  });

  @override
  List<Object?> get props => [
        id,
        type,
        links,
        attributes,
      ];
}

class LinkPathViewData extends Equatable {
  final String? path;
  const LinkPathViewData({
    required this.path,
  });

  @override
  List<Object?> get props => [path];
}
