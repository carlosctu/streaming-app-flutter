import 'package:components/design_components.dart';
import 'package:features/splash_screen/sign_up/bloc/sign_up_bloc.dart';
import 'package:features/splash_screen/sign_up/bloc/sign_up_event.dart';
import 'package:features/splash_screen/sign_up/bloc/sign_up_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:email_validator/email_validator.dart';

class SignUpPage extends StatefulWidget {
  const SignUpPage({super.key});

  static const route = "/sign-up";

  @override
  State<SignUpPage> createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  final _formKey = GlobalKey<FormState>();
  TextEditingController nameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController confirmPasswordController = TextEditingController();
  bool _obscureText = false;

  @override
  Widget build(BuildContext context) {
    final bloc = BlocProvider.of<SignUpBloc>(context);

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: IconButton(
          splashRadius: 18,
          icon: const Icon(
            Icons.arrow_back_outlined,
            size: 24,
            color: Color(0xffD93B41),
          ),
          onPressed: () => Navigator.pop(context),
        ),
      ),
      body: SingleChildScrollView(
        child: Container(
          alignment: Alignment.center,
          padding: const EdgeInsets.all(16),
          child: Column(
            children: [
              Container(
                padding: const EdgeInsets.symmetric(vertical: 16),
                child: const Text(
                  "Create your account",
                  style: TextStyle(fontSize: 26),
                  textAlign: TextAlign.center,
                ),
              ),
              ListView(
                shrinkWrap: true,
                children: [
                  Form(
                    key: _formKey,
                    child: Column(
                      children: [
                        InputFormField(
                          labelText: 'Name',
                          controller: nameController,
                          prefixIcon: const Icon(Icons.person),
                          onChanged: (value) => bloc.add(
                            SignUpEventUpdate(nameValue: value),
                          ),
                          validator: (value) {
                            if (value!.isEmpty) return 'Please enter a name';
                            return null;
                          },
                        ),
                        InputFormField(
                          controller: emailController,
                          prefixIcon: const Icon(Icons.mail),
                          validator: (value) {
                            if (EmailValidator.validate(value!) == false) {
                              return 'Please enter a valid email';
                            }
                            return null;
                          },
                          labelText: 'Email',
                          onChanged: (value) => bloc.add(
                            SignUpEventUpdate(emailValue: value),
                          ),
                        ),
                        InputFormField(
                          controller: passwordController,
                          labelText: 'Password',
                          obscureText: _obscureText,
                          prefixIcon: const Icon(Icons.lock),
                          suffixIcon: IconButton(
                            highlightColor: Colors.transparent,
                            splashColor: Colors.transparent,
                            icon: Icon(
                              _obscureText
                                  ? Icons.visibility
                                  : Icons.visibility_off,
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
                          onChanged: (value) => bloc.add(
                            SignUpEventUpdate(confirmPasswordValue: value),
                          ),
                        ),
                        InputFormField(
                          obscureText: _obscureText,
                          controller: confirmPasswordController,
                          labelText: 'Confirm Password',
                          prefixIcon: const Icon(Icons.lock),
                          validator: (value) {
                            if (value != passwordController.text) {
                              return 'Passwords do not match.';
                            }
                            return null;
                          },
                          onChanged: (value) => bloc.add(
                            SignUpEventUpdate(confirmPasswordValue: value),
                          ),
                        ),
                        const SizedBox(height: 16),
                        BlocBuilder<SignUpBloc, SignUpState>(
                          builder: (context, state) {
                            return StyledCustomButton(
                              isDisabled: false,
                              onPressed: () {
                                if (_formKey.currentState!.validate()) {
                                  Navigator.pop(context);
                                }
                              },
                              content: const Text('Sign up'),
                            );
                          },
                        )
                      ],
                    ),
                  )
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}

class InputFormField extends StatelessWidget {
  final TextEditingController? controller;
  final String labelText;
  final String? Function(String?) validator;
  final Function(String)? onChanged;
  final bool obscureText;
  final Widget? suffixIcon;
  final Widget? prefixIcon;

  const InputFormField({
    super.key,
    required this.controller,
    required this.labelText,
    required this.validator,
    this.onChanged,
    this.obscureText = false,
    this.suffixIcon,
    this.prefixIcon,
  });

  @override
  Widget build(BuildContext context) {
    return Theme(
      data: Theme.of(context).copyWith(
        colorScheme: ThemeData().colorScheme.copyWith(
              primary: const Color(0xff3EA1D2),
            ),
      ),
      child: TextFormField(
        controller: controller,
        obscureText: obscureText,
        maxLines: 1,
        decoration: InputDecoration(
          labelText: labelText,
          suffixIcon: suffixIcon,
          prefixIcon: prefixIcon,
          focusColor: Colors.red,
          focusedBorder: const UnderlineInputBorder(
            borderSide: BorderSide(
              color: Color(0xff3EA1D2),
            ),
          ),
        ),
        autovalidateMode: AutovalidateMode.onUserInteraction,
        validator: validator,
        onChanged: onChanged,
      ),
    );
  }
}
