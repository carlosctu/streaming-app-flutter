import 'package:components/design_components.dart';
import 'package:features/home/home_page.dart';
import 'package:features/shared/alerts/snack_bar_alert.dart';
import 'package:features/shared/providers/user_info_cubit.dart';
import 'package:features/splash_screen/sign_in/bloc/sign_in_bloc.dart';
import 'package:features/splash_screen/sign_in/widgets/sign_in_form.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SignInAuthButtons extends StatefulWidget {
  const SignInAuthButtons({
    super.key,
  });

  @override
  State<SignInAuthButtons> createState() => _SignInAuthButtonsState();
}

class _SignInAuthButtonsState extends State<SignInAuthButtons> {
  final _formKey = GlobalKey<FormState>();
  bool _isLoading = false;

  void listenerValidator(BuildContext context, SignInState state) {
    final userInfoCubit = context.read<UserInfoCubit>();

    switch (state.status) {
      case SignInStatus.loading:
        setState(() => _isLoading = true);
        break;
      case SignInStatus.valid:
        setState(() => _isLoading = false);
        _formKey.currentState!.reset();
        userInfoCubit.updateUserInfo(state.credential);
        Navigator.pushNamed(context, HomePage.route);
        break;
      case SignInStatus.invalid:
        setState(() => _isLoading = false);
        showSnackAlert(
          context: context,
          status: SnackBarStatus.negative,
          message: state.exception ?? '',
        );
        break;
      default:
        break;
    }
  }

  @override
  Widget build(BuildContext context) {
    final bloc = BlocProvider.of<SignInBloc>(context);
    return BlocBuilder<SignInBloc, SignInState>(
      builder: (context, state) {
        return BlocListener<SignInBloc, SignInState>(
          listener: listenerValidator,
          child: Wrap(
            alignment: WrapAlignment.center,
            runSpacing: 4,
            children: [
              SignInForm(
                provider: bloc,
                loading: _isLoading,
                formKey: _formKey,
              ),
              const HorizontalDivider(text: "or"),
              _SignInSocialMediaButtons(provider: bloc),
            ],
          ),
        );
      },
    );
  }
}

class _SignInSocialMediaButtons extends StatelessWidget {
  final SignInBloc provider;
  const _SignInSocialMediaButtons({
    required this.provider,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        StyledAuthButton(
          label: "Continue with Google",
          onPressed: () => provider.add(
            SignInEventUserAuthenticated(
              authType: AuthenticationType.google,
            ),
          ),
          asset: StreamingAppAssets.google,
        ),
        StyledAuthButton(
          label: "Continue with Twitter",
          asset: StreamingAppAssets.twitter,
          onPressed: () => provider.add(
            SignInEventUserAuthenticated(
              authType: AuthenticationType.twitter,
            ),
          ),
        ),
      ],
    );
  }
}
