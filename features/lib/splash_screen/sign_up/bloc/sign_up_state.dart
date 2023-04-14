abstract class SignUpState {}

class SignUpInitialState extends SignUpState {}

class SignUpLoadingState extends SignUpState {}

class SignUpValidState extends SignUpState {}

class SignUpInvalidState extends SignUpState {
  final String exception;
  SignUpInvalidState({required this.exception});
}

class SignUpErrorState extends SignUpState {
  final String errorMessage;

  SignUpErrorState({required this.errorMessage});
}
