import 'package:equatable/equatable.dart';
import 'package:features/home/model/anime_list_view_data.dart';

class HomeViewData extends Equatable {
  final List<AnimeViewData> data;
  const HomeViewData({
    required this.data,
  });

  @override
  List<Object> get props => [data];
}
