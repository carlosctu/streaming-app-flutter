import 'package:components/design_components.dart';
import 'package:email_validator/email_validator.dart';
import 'package:features/splash_screen/sign_up/bloc/sign_up_bloc.dart';
import 'package:features/splash_screen/sign_up/bloc/sign_up_event.dart';
import 'package:flutter/material.dart';

class SignUpFormFields extends StatefulWidget {
  final SignUpBloc provider;
  const SignUpFormFields({
    super.key,
    required this.provider,
  });

  @override
  State<SignUpFormFields> createState() => _SignUpFormFieldsState();
}

class _SignUpFormFieldsState extends State<SignUpFormFields> {
  bool _obscureText = true;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        InputFormField(
          labelText: 'Name',
          prefixIcon: Icons.person,
          onChanged: (value) => widget.provider.add(
            SignUpEventUpdate(nameValue: value),
          ),
          validator: (value) {
            if (value!.isEmpty) return 'Please enter a name';
            return null;
          },
        ),
        InputFormField(
          prefixIcon: Icons.mail,
          validator: (value) {
            if (EmailValidator.validate(value!) == false) {
              return 'Please enter a valid email';
            }
            return null;
          },
          labelText: 'Email',
          onChanged: (value) => widget.provider.add(
            SignUpEventUpdate(emailValue: value),
          ),
        ),
        InputFormField(
          labelText: 'Password',
          obscureText: _obscureText,
          prefixIcon: Icons.lock,
          suffixIcon: IconButton(
            highlightColor: Colors.transparent,
            splashColor: Colors.transparent,
            icon: Icon(
              _obscureText ? Icons.visibility : Icons.visibility_off,
            ),
            onPressed: () {
              setState(() => _obscureText = !_obscureText);
            },
          ),
          validator: (value) {
            if (value!.length < 6) {
              return 'Password must be at least 6 length long.';
            }
            return null;
          },
          onChanged: (value) => widget.provider.add(
            SignUpEventUpdate(passwordValue: value),
          ),
        ),
        InputFormField(
          obscureText: _obscureText,
          labelText: 'Confirm Password',
          prefixIcon: Icons.lock,
          validator: (value) {
            if (value != widget.provider.model.passwordValue) {
              return 'Passwords do not match.';
            }
            return null;
          },
          onChanged: (value) => widget.provider.add(
            SignUpEventUpdate(confirmPasswordValue: value),
          ),
        ),
        const SizedBox(height: 16),
      ],
    );
  }
}
