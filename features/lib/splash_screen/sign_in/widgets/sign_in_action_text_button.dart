import 'package:features/splash_screen/sign_up/sign_up_page.dart';
import 'package:flutter/material.dart';

class SignInFooterText extends StatelessWidget {
  const SignInFooterText({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const Text(
          'Dont have an account?',
        ),
        TextButton(
          style: ButtonStyle(
              foregroundColor:
                  MaterialStateProperty.all(const Color(0xffD93B41)),
              overlayColor: MaterialStateProperty.all(Colors.transparent)),
          onPressed: () => Navigator.pushNamed(context, SignUpPage.route),
          child: const Text(
            "Sign up!.",
          ),
        )
      ],
    );
  }
}
