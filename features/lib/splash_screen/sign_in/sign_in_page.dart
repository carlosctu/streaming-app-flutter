import 'package:features/splash_screen/sign_in/widgets/sign_in_action_text_button.dart';
import 'package:features/splash_screen/sign_in/widgets/sign_in_auth_buttons.dart';
import 'package:flutter/material.dart';


class SignInPage extends StatefulWidget {
  const SignInPage({super.key});

  static const route = "/";

  @override
  State<SignInPage> createState() => _SignInPageState();
}

class _SignInPageState extends State<SignInPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: const [
              SignInHeader(),
              SignInAuthButtons(),
              SignInFooterText(),
            ],
          ),
        ),
      ),
    );
  }
}

class SignInHeader extends StatelessWidget {
  const SignInHeader({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 16),
      child: const Text(
        "Welcome to StreamingApp!",
        style: TextStyle(fontSize: 28),
        textAlign: TextAlign.center,
      ),
    );
  }
}
