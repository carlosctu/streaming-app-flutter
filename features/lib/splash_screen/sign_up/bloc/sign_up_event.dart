import 'package:features/splash_screen/sign_up/model/sign_up_model.dart';

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

  SignUpEventUpdate copyWith({
    String? nameValue,
    String? emailValue,
    String? passwordValue,
    String? confirmPasswordValue,
  }) {
    return SignUpEventUpdate(
      nameValue: nameValue ?? this.nameValue,
      emailValue: emailValue ?? this.emailValue,
      passwordValue: passwordValue ?? this.passwordValue,
      confirmPasswordValue: confirmPasswordValue ?? this.confirmPasswordValue,
    );
  }
}

class SignUpEventSubmitted extends SignUpEvent {
  final SignUpModel model;

  SignUpEventSubmitted({required this.model});
}
