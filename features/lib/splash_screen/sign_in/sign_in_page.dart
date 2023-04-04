import 'package:components/design_components.dart';
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
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(
                padding: const EdgeInsets.symmetric(vertical: 16),
                child: const Text(
                  "Welcome to StreamingApp!",
                  style: TextStyle(fontSize: 28),
                  textAlign: TextAlign.center,
                ),
              ),
              StyledAuthButton(
                label: "Continue with Google",
                onPressed: () {},
                asset: StreamingAppAssets.google,
              ),
              StyledAuthButton(
                label: "Continue with Facebook",
                asset: StreamingAppAssets.facebook,
                onPressed: () {},
              ),
              StyledAuthButton(
                label: "Continue with Github",
                asset: StreamingAppAssets.github,
                onPressed: () {},
              ),
              const HorizontalDivider(
                text: "or",
              ),
              StyledCustomButton(
                content: const TextIconRow(
                  icon: IconAsset.mail,
                  alignment: RowAlignment.center,
                  label: 'Continue with email',
                ),
                onPressed: () {},
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text(
                    'Dont have an account?',
                  ),
                  TextButton(
                    style: ButtonStyle(
                        foregroundColor:
                            MaterialStateProperty.all(const Color(0xffD93B41)),
                        overlayColor:
                            MaterialStateProperty.all(Colors.transparent)),
                    onPressed: () {},
                    child: const Text(
                      "Sign up!.",
                    ),
                  )
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
