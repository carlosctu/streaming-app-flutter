import 'package:features/splash_screen/services/authentication_service.dart';
import 'package:features/splash_screen/sign_in/repository/sign_in_repository.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'sign_in_event.dart';
part 'sign_in_state.dart';

class SignInBloc extends Bloc<SignInEvent, SignInState> {
  // final AuthenticationService _authService;
  final SignInRepository _repository;
  SignInBloc(
    // this._authService,
    this._repository,
  ) : super(const SignInState.initial()) {
    on<SignInEventLoginWithCredentials>((event, emit) async {
      if (event.credential == null) {
        return emit(state.invalidLoginWithSavedCredential());
      }

      try {
        final credentials = await _repository.signInWithToken(event.credential);
        emit(state.loginWithSavedCredential(credentials));
      } catch (_) {
        emit(state.invalidLoginWithSavedCredential());
      }
    });

    on<SignInEventUserAuthenticated>((event, emit) async {
      emit(state.loading());

      try {
        UserCredential userCredential;
        switch (event.authType) {
          case AuthenticationType.google:
            userCredential = await _repository.googleSignIn();
            break;
          case AuthenticationType.twitter:
            userCredential = await _repository.twitterSignIn();
            break;
          case AuthenticationType.email:
            userCredential = await _repository.emailSignIn(
                email: event.email, password: event.password);
            break;
        }

        // final userData = userCredential.credential;

        // if (userData != null) {
        //   await _authService.saveData(userData);
        // }

        emit(state.validState(userCredential));
      } catch (e) {
        // final exception = e.toString().split("Exception: ")[1];
        emit(state.invalidState(e.toString()));
      }
    });
  }
}
