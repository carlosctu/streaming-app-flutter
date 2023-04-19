import 'package:components/design_components.dart';
import 'package:email_validator/email_validator.dart';
import 'package:features/splash_screen/sign_in/bloc/sign_in_bloc.dart';
import 'package:flutter/material.dart';

class SignInForm extends StatefulWidget {
  final SignInBloc provider;

  const SignInForm({super.key, required this.provider});

  @override
  State<SignInForm> createState() => _SignInFormState();
}

class _SignInFormState extends State<SignInForm> {
  bool _obscureText = true;
  final _formKey = GlobalKey<FormState>();
  String _emailId = '';
  String _password = '';

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Form(
          key: _formKey,
          child: Container(
            padding: const EdgeInsets.only(
              left: 16,
              right: 16,
              bottom: 16,
            ),
            child: Column(
              children: [
                InputFormField(
                  prefixIcon: Icons.mail,
                  labelText: 'Email',
                  onSaved: (value) => _emailId = value!,
                  validator: (value) {
                    if (EmailValidator.validate(value!) == false) {
                      return 'Please enter a valid email';
                    }
                    return null;
                  },
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
                    if (value!.isEmpty) return 'Password must not be empty';
                    return null;
                  },
                  onSaved: (value) => _password = value!,
                ),
              ],
            ),
          ),
        ),
        StyledCustomButton(
          content: const TextIconRow(
            icon: IconAsset.mail,
            alignment: RowAlignment.center,
            label: 'Sign in with email',
          ),
          onPressed: () {
            if (_formKey.currentState!.validate()) {
              _formKey.currentState!.save();
              widget.provider.add(
                SignInEventUserAuthenticated(
                  authType: AuthenticationType.email,
                  email: _emailId,
                  password: _password,
                ),
              );
            }
          },
        ),
      ],
    );
  }
}
