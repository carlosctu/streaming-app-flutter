abstract class SignUpState {}

class SignUpInitialState extends SignUpState {}

class SignUpLoadingState extends SignUpState {}

class SignUpValidState extends SignUpState {
  static const successfulMessage = "Account successfully created!";
}

class SignUpInvalidState extends SignUpState {
  final String exception;
  SignUpInvalidState({required this.exception});
}
