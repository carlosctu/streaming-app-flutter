import 'package:features/splash_screen/sign_up/bloc/sign_up_event.dart';
import 'package:features/splash_screen/sign_up/bloc/sign_up_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:email_validator/email_validator.dart';

class SignUpBloc extends Bloc<SignUpEvent, SignUpState> {
  SignUpBloc() : super(SignUpInitialState()) {
    on<SignUpEventUpdate>((event, emit) {
      if (event.emailValue.isEmpty &&
          EmailValidator.validate(event.emailValue) == false) {
        emit(
            SignUpErrorState(errorMessage: "Please enter valid email address"));
      } else if (event.passwordValue != event.confirmpasswordValue) {
        emit(SignUpErrorState(errorMessage: "Passwords do not match!"));
      } else if (event.passwordValue.length < 6) {
        emit(SignUpErrorState(
            errorMessage: "Password must   at least 6 characters length!"));
      } else {
        emit(SignUpInvalidState());
      }
    });

    on<SignUpEventSubmitted>((event, emit) {
      emit(SignUpLoadingState());
    });
  }
}
