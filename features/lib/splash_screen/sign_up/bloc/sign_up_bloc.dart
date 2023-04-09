import 'package:features/splash_screen/sign_up/bloc/sign_up_event.dart';
import 'package:features/splash_screen/sign_up/bloc/sign_up_state.dart';
import 'package:features/splash_screen/sign_up/model/sign_up_model.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SignUpBloc extends Bloc<SignUpEvent, SignUpState> {
  SignUpModel _model = const SignUpModel.empty();

  SignUpBloc() : super(SignUpInitialState()) {
    on<SignUpEventUpdate>((event, emit) {
      _updateState(
        event.nameValue ?? model.nameValue,
        event.emailValue ?? model.emailValue,
        event.passwordValue ?? model.passwordValue,
        event.confirmpasswordValue ?? model.confirmpasswordValue,
      );
    });

    on<SignUpEventSubmitted>((event, emit) {
      emit(SignUpLoadingState());
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
