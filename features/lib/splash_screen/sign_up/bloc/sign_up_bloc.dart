import 'package:features/splash_screen/sign_up/bloc/sign_up_event.dart';
import 'package:features/splash_screen/sign_up/bloc/sign_up_state.dart';
import 'package:features/splash_screen/sign_up/model/sign_up_model.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SignUpBloc extends Bloc<SignUpEvent, SignUpState> {
  SignUpBloc() : super(SignUpInitialState()) {
    on<SignUpEventUpdate>((event, emit) {
      if (event.emailValue.isEmpty) {
        emit(SignUpErrorState(errorMessage: "Please enter valid email adress"));
      }
    });
    on<SignUpEventSubmitted>((event, emit) {});
  }

  SignUpModel _model = SignUpModel(
    name: '',
    email: '',
    password: '',
    confirmpassword: '',
  );

  _updateProduct(
    String name,
    String email,
    String password,
    String confirmpassword,
  ) {
    _model = _model.copyWith(
      name: name,
      email: email,
      password: password,
      confirmpassword: confirmpassword,
    );
  }
}
