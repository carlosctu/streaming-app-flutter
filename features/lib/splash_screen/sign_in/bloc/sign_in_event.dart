part of 'sign_in_bloc.dart';

@immutable
abstract class SignInEvent {}

enum AuthenticationType { email, google, twitter }

class SignInEventUserAuthenticated extends SignInEvent {
  final AuthenticationType authType;
  SignInEventUserAuthenticated({
    required this.authType,
  });
}
