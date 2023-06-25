import 'package:features/shared/providers/user_info_cubit.dart';
import 'package:features/splash_screen/services/authentication_service.dart';
import 'package:features/splash_screen/sign_in/bloc/sign_in_bloc.dart';
import 'package:features/splash_screen/sign_in/widgets/sign_in_action_text_button.dart';
import 'package:features/splash_screen/sign_in/widgets/sign_in_auth_buttons.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SignInPage extends StatefulWidget {
  const SignInPage({super.key});

  static const route = "/";

  @override
  State<SignInPage> createState() => _SignInPageState();
}

class _SignInPageState extends State<SignInPage> {
  SignInBloc get signInBloc => context.read<SignInBloc>();

  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback(
      (_) async => await getUserData(),
    );
    super.initState();
  }

  Future getUserData() async {
    final authService = AuthenticationService();
    final credentials = await authService.getUserLogin();
    signInBloc.add(SignInEventLoginWithCredentials(credential: credentials));
  }

  void navigateIfUseHasSavedCredentials(
      BuildContext context, SignInState state) {
    final userInfoCubit = context.read<UserInfoCubit>();
    switch (state.status) {
      case SignInStatus.validSavedCredentials:
        userInfoCubit.updateUserInfo(state.credential);
        Navigator.pushNamed(context, '/home');
        break;
      default:
        return;
    }
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SignInBloc, SignInState>(
      builder: (context, state) {
        return BlocListener<SignInBloc, SignInState>(
          listener: navigateIfUseHasSavedCredentials,
          child: Scaffold(
            resizeToAvoidBottomInset: false,
            body: SafeArea(
              child: SingleChildScrollView(
                child: Container(
                  height: MediaQuery.of(context).size.height,
                  padding: const EdgeInsets.all(16.0),
                  alignment: Alignment.center,
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
            ),
          ),
        );
      },
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
