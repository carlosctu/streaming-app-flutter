part of 'sign_in_bloc.dart';

@immutable
abstract class SignInState {}

class SignInInitialState extends SignInState {}

class SignInLoadingState extends SignInState {}

class SignInValidState extends SignInState {
  final UserCredential credential;

  SignInValidState({required this.credential});
}

class SignInInvalidState extends SignInState {
  final String exception;
  SignInInvalidState({required this.exception});
}
