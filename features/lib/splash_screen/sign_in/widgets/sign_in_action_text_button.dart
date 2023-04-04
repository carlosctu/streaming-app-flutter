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
          onPressed: () {},
          child: const Text(
            "Sign up!.",
          ),
        )
      ],
    );
  }
}
