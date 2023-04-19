part of 'sign_in_bloc.dart';

@immutable
abstract class SignInEvent {}

enum AuthenticationType { email, google, twitter }

class SignInEventUpdate extends SignInEvent {
  final String email;
  final String password;
  SignInEventUpdate({
    required this.email,
    required this.password,
  });

  SignInEventUpdate copyWith({
    String? email,
    String? password,
  }) {
    return SignInEventUpdate(
      email: email ?? this.email,
      password: password ?? this.password,
    );
  }
}

class SignInEventUserAuthenticated extends SignInEvent {
  final AuthenticationType authType;
  final String email;
  final String password;
  SignInEventUserAuthenticated({
    required this.authType,
    this.email = '',
    this.password = '',
  }) : assert(
            authType == AuthenticationType.email
                ? password.isNotEmpty && email.isNotEmpty
                : true,
            'Email and Password must not be empty');
}
