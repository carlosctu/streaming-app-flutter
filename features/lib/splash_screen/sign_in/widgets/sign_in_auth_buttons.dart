import 'package:components/design_components.dart';
import 'package:features/home/home.dart';
import 'package:features/splash_screen/sign_in/bloc/sign_in_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

enum SnackBarStatus { positive, negative }

class SignInAuthButtons extends StatelessWidget {
  const SignInAuthButtons({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final bloc = BlocProvider.of<SignInBloc>(context);
    void showSnackAlert({
      required BuildContext context,
      required SnackBarStatus status,
      required String message,
    }) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          behavior: SnackBarBehavior.floating,
          dismissDirection: DismissDirection.down,
          content: Text(message),
          duration: const Duration(seconds: 4),
          backgroundColor: status == SnackBarStatus.positive
              ? const Color(0xff408140)
              : const Color(0xffD93B41),
          action: status == SnackBarStatus.negative
              ? SnackBarAction(
                  label: 'X',
                  textColor: Colors.white,
                  onPressed: () =>
                      ScaffoldMessenger.of(context).hideCurrentSnackBar(),
                )
              : null,
        ),
      );
    }

    void listenerValidator(BuildContext context, SignInState state) {
      if (state is SignInValidState) {
        print(state.credential.user);
        Navigator.pushNamed(context, Home.route);
      } else if (state is SignInInvalidState) {
        showSnackAlert(
          context: context,
          status: SnackBarStatus.negative,
          message: state.exception,
        );
      }
    }

    return BlocBuilder<SignInBloc, SignInState>(
      builder: (context, state) {
        return BlocListener<SignInBloc, SignInState>(
          listener: listenerValidator,
          child: Wrap(
            alignment: WrapAlignment.center,
            runSpacing: 4,
            children: [
              StyledAuthButton(
                label: "Continue with Google",
                onPressed: () => bloc.add(SignInEventUserAuthenticated()),
                // final provider =
                //     Provider.of<SignInController>(context, listen: false);
                // provider.googleLogin();
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
      },
    );
  }
}
