part of 'anime_page_bloc.dart';

@immutable
abstract class AnimePageState {}

class AnimePageInitialState extends AnimePageState {}

class AnimePageLoadingState extends AnimePageState {}

class AnimePageValidState extends AnimePageState {}

class AnimePageInvalidState extends AnimePageState {}
