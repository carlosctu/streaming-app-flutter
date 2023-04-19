import 'package:components/design_components.dart';
import 'package:features/shared/alerts/snack_bar_alert.dart';
import 'package:features/splash_screen/sign_up/bloc/sign_up_bloc.dart';
import 'package:features/splash_screen/sign_up/bloc/sign_up_event.dart';
import 'package:features/splash_screen/sign_up/bloc/sign_up_state.dart';
import 'package:features/splash_screen/sign_up/widgets/sign_up_form_fields.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SignUpPage extends StatefulWidget {
  const SignUpPage({super.key});

  static const route = "/sign-up";

  @override
  State<SignUpPage> createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  final _formKey = GlobalKey<FormState>();
  bool _isLoading = false;

  void listenerValidator(BuildContext context, SignUpState state) {
    if (state is SignUpLoadingState) {
      setState(() => _isLoading = true);
    }

    if (state is SignUpValidState) {
      if (context.mounted) {
        _isLoading = false;
        _formKey.currentState!.reset();
        showSnackAlert(
          context: context,
          status: SnackBarStatus.positive,
          message: SignUpValidState.successfulMessage,
        );
        Navigator.pop(context);
      }
    } else if (state is SignUpInvalidState) {
      _isLoading = false;
      showSnackAlert(
        context: context,
        status: SnackBarStatus.negative,
        message: state.exception,
      );
    }
  }

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
      body: BlocBuilder<SignUpBloc, SignUpState>(
        builder: (context, state) {
          return SingleChildScrollView(
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
                  BlocListener<SignUpBloc, SignUpState>(
                    listener: listenerValidator,
                    child: ListView(
                      shrinkWrap: true,
                      children: [
                        Form(
                          key: _formKey,
                          autovalidateMode: AutovalidateMode.onUserInteraction,
                          child: SignUpFormFields(provider: bloc),
                        ),
                        StyledCustomButton(
                          isLoading: _isLoading,
                          onPressed: () =>
                              bloc.add(SignUpEventSubmitted(model: bloc.model)),
                          content: const Text('Sign up'),
                        )
                      ],
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
