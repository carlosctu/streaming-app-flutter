import 'package:components/design_components.dart';
import 'package:features/splash_screen/sign_in/sign_in_controller.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class SignInAuthButtons extends StatelessWidget {
  const SignInAuthButtons({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (BuildContext context) {
        return SignInController();
      },
      builder: (context, child) => Wrap(
        alignment: WrapAlignment.center,
        runSpacing: 4,
        children: [
          StyledAuthButton(
            label: "Continue with Google",
            onPressed: () {
              final provider =
                  Provider.of<SignInController>(context, listen: false);
              provider.googleLogin();
            },
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
        ],
      ),
    );
  }
}
