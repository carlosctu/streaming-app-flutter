import 'package:features/splash_screen/sign_up/bloc/sign_up_event.dart';
import 'package:features/splash_screen/sign_up/bloc/sign_up_state.dart';
import 'package:features/splash_screen/sign_up/model/sign_up_model.dart';
import 'package:features/splash_screen/sign_up/repository/sign_up_repository.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SignUpBloc extends Bloc<SignUpEvent, SignUpState> {
  final SignUpRepository _repository;
  SignUpModel _model = const SignUpModel.empty();

  SignUpBloc(this._repository) : super(SignUpInitialState()) {
    on<SignUpEventUpdate>((event, emit) {
      _updateState(
        event.nameValue ?? model.nameValue,
        event.emailValue ?? model.emailValue,
        event.passwordValue ?? model.passwordValue,
        event.confirmPasswordValue ?? model.confirmpasswordValue,
      );
    });

    on<SignUpEventSubmitted>((event, emit) async {
      emit(SignUpLoadingState());
      try {
        await _repository.signUpWithEmailAndPassword(
          email: event.model.emailValue,
          password: event.model.passwordValue,
        );
        emit(SignUpValidState());
      } catch (e) {
        final exception = e.toString().split("Exception: ")[1];
        emit(SignUpInvalidState(exception: exception));
      }
    });
  }

  _updateState(
    String name,
    String email,
    String password,
    String confirmpassword,
  ) {
    _model = _model.copyWith(
      nameValue: name,
      emailValue: email,
      passwordValue: password,
      confirmpasswordValue: confirmpassword,
    );
  }

  SignUpModel get model => _model;
}
