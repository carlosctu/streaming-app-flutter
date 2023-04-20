part of 'home_bloc.dart';

@immutable
abstract class HomeState {}

class HomeInitialState extends HomeState {}
class HomeLoadingState extends HomeState {}
class HomeValidState extends HomeState {}
class HomeInvalidState extends HomeState {}
