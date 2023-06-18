part of 'sign_in_bloc.dart';

enum SignInStatus {
  valid,
  loading,
  invalid,
  validSavedCredentials,
  invalidSavedCredentials,
}

class SignInState {
  final SignInStatus status;
  final UserCredential? credential;
  final String? exception;
  const SignInState._({
    this.status = SignInStatus.loading,
    this.credential,
    this.exception,
  });

  const SignInState.initial() : this._();

  SignInState loading() => copyWith(status: SignInStatus.loading);

  SignInState validState(UserCredential? credential) => copyWith(
        status: SignInStatus.valid,
        credential: credential,
      );

  SignInState invalidState(String? ex) => copyWith(
        status: SignInStatus.invalid,
        exception: ex,
      );

  SignInState loginWithSavedCredential(UserCredential? credential) => copyWith(
      status: SignInStatus.validSavedCredentials, credential: credential);

  SignInState invalidLoginWithSavedCredential() =>
      copyWith(status: SignInStatus.invalidSavedCredentials);

  SignInState copyWith({
    SignInStatus? status,
    UserCredential? credential,
    String? exception,
  }) {
    return SignInState._(
      status: status ?? this.status,
      credential: credential ?? this.credential,
      exception: exception ?? this.exception,
    );
  }
}

// class SignInInitialState extends SignInState {}

// class SignInLoadingState extends SignInState {}

// class SignInValidState extends SignInState {
//   final UserCredential credential;
//   SignInValidState({required this.credential});
// }

// class SignInInvalidState extends SignInState {
//   final String exception;
//   SignInInvalidState({required this.exception});
// }

// class SignInWithCredentialState extends SignInState {
//   final UserCredential credential;
//   SignInWithCredentialState({required this.credential});
// }

// class SignInInvalidSavedCredentialState extends SignInState {}
