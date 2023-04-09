import 'package:components/design_components.dart';
import 'package:features/splash_screen/sign_up/bloc/sign_up_bloc.dart';
import 'package:features/splash_screen/sign_up/bloc/sign_up_event.dart';
import 'package:features/splash_screen/sign_up/bloc/sign_up_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SignUpPage extends StatefulWidget {
  const SignUpPage({super.key});

  static const route = "/sign-up";

  @override
  State<SignUpPage> createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  final _formKey = GlobalKey();
  TextEditingController nameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController confirmPasswordController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    final bloc = BlocProvider.of<SignUpBloc>(context);

    // _updateForm() {
    //   bloc.add(SignUpEventUpdate(
    //     nameController.text,
    //     emailController.text,
    //     passwordController.text,
    //     confirmPasswordController.text,
    //   ));
    // }

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
      ),
      body: Container(
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
            Column(
              children: [
                BlocBuilder<SignUpBloc, SignUpState>(builder: (context, state) {
                  if (state is SignUpErrorState) {
                    return Text(state.errorMessage);
                  }
                  return const SizedBox.shrink();
                }),
                TextFormField(
                  controller: nameController,
                  decoration: const InputDecoration(
                    labelText: 'Name',
                  ),
                  onChanged: (value) {
                    bloc.add(SignUpEventUpdate(nameValue: value));
                  },
                ),
                TextFormField(
                  controller: emailController,
                  decoration: const InputDecoration(
                    labelText: 'Email',
                  ),
                  onChanged: (value) {
                    bloc.add(SignUpEventUpdate(emailValue: value));
                  },
                ),
                TextFormField(
                  controller: passwordController,
                  decoration: const InputDecoration(
                    labelText: 'Password',
                  ),
                  onChanged: (value) {
                    bloc.add(SignUpEventUpdate(passwordValue: value));
                  },
                ),
                TextFormField(
                  controller: confirmPasswordController,
                  decoration: const InputDecoration(
                    labelText: 'Confirm Password',
                  ),
                  onChanged: (value) {
                    bloc.add(SignUpEventUpdate(confirmpasswordValue: value));
                  },
                ),
                const SizedBox(height: 16),
                BlocBuilder<SignUpBloc, SignUpState>(
                  builder: (context, state) {
                    return StyledCustomButton(
                      onPressed: () {
                        print(bloc.model);
                      },
                      content: state is SignUpErrorState
                          ? const Text('Error')
                          : const Text('Sign up'),
                    );
                  },
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}

class InputFormField extends StatelessWidget {
  const InputFormField({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      decoration: const InputDecoration(
        labelText: 'Name',
      ),
      autovalidateMode: AutovalidateMode.onUserInteraction,
      validator: (value) {
        if (value != null) {
          return 'Por favor, insira seu nome.';
        }
        return null;
      },
      onSaved: (value) {
        // _nome = value;
      },
    );
  }
}
