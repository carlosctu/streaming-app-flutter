import 'package:equatable/equatable.dart';

class SignUpModel extends Equatable {
  final String nameValue;
  final String emailValue;
  final String passwordValue;
  final String confirmpasswordValue;

  const SignUpModel(
    this.nameValue,
    this.emailValue,
    this.passwordValue,
    this.confirmpasswordValue,
  );

  const SignUpModel.empty({
    this.nameValue = '',
    this.emailValue = '',
    this.passwordValue = '',
    this.confirmpasswordValue = '',
  });

  @override
  List<Object?> get props => [
        nameValue,
        emailValue,
        passwordValue,
        confirmpasswordValue,
      ];

  SignUpModel copyWith({
    String? nameValue,
    String? emailValue,
    String? passwordValue,
    String? confirmpasswordValue,
  }) {
    return SignUpModel(
      nameValue ?? this.nameValue,
      emailValue ?? this.emailValue,
      passwordValue ?? this.passwordValue,
      confirmpasswordValue ?? this.confirmpasswordValue,
    );
  }
}
