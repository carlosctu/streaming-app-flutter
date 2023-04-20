import 'package:equatable/equatable.dart';
import 'package:features/home/model/anime_attributes_view_data.dart';

class AnimeListViewData extends Equatable {
  final String? id;
  final String? type;
  final LinkPathViewData? links;
  final AnimeAttributesViewData? attributes;
  const AnimeListViewData({
    this.id,
    this.type,
    this.links,
    this.attributes,
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
    this.path,
  });

  @override
  List<Object?> get props => [path];
}
