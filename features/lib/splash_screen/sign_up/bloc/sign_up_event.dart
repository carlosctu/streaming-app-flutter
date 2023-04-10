abstract class SignUpEvent {}

class SignUpEventUpdate extends SignUpEvent {
  final String? nameValue;
  final String? emailValue;
  final String? passwordValue;
  final String? confirmPasswordValue;

  SignUpEventUpdate({
    this.nameValue,
    this.emailValue,
    this.passwordValue,
    this.confirmPasswordValue,
  });
}

class SignUpEventSubmitted extends SignUpEvent {
  final String name;
  final String email;
  final String password;

  SignUpEventSubmitted(
    this.name,
    this.email,
    this.password,
  );
}
