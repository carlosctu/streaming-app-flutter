import 'package:features/splash_screen/sign_in/repository/sign_in_repository.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'sign_in_event.dart';
part 'sign_in_state.dart';

class SignInBloc extends Bloc<SignInEvent, SignInState> {
  final SignInRepository _repository;
  SignInBloc(this._repository) : super(SignInInitialState()) {
    on<SignInEventUserAuthenticated>((event, emit) async {
      emit(SignInLoadingState());
      try {
        UserCredential userCredential = await _repository.twitterSignIn();
        emit(SignInValidState(credential: userCredential));
      } catch (e) {
        final exception = e.toString().split("Exception: ")[1];
        emit(SignInInvalidState(exception: exception));
      }
    });
  }
}
