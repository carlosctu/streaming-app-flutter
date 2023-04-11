import 'package:components/design_components.dart';
import 'package:features/splash_screen/sign_up/bloc/sign_up_bloc.dart';
import 'package:features/splash_screen/sign_up/bloc/sign_up_state.dart';
import 'package:features/splash_screen/sign_up/config/sign_up_page_mixin.dart';
import 'package:features/splash_screen/sign_up/model/sign_up_model.dart';
import 'package:features/splash_screen/sign_up/widgets/sign_up_form_fields.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:firebase_auth/firebase_auth.dart';

class SignUpPage extends StatefulWidget {
  const SignUpPage({super.key});

  static const route = "/sign-up";

  @override
  State<SignUpPage> createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> with SignUpPageMixin {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final _formKey = GlobalKey<FormState>();
  bool _isLoading = false;

  Future<void> _signUp(SignUpModel model) async {
    if (!_formKey.currentState!.validate()) return;

    setState(() => _isLoading = true);

    try {
      await _auth.createUserWithEmailAndPassword(
        email: model.emailValue,
        password: model.passwordValue,
      );
      if (context.mounted) {
        _formKey.currentState!.reset();
        showSnackAlert(context: context, status: SnackBarStatus.positive);
        Navigator.pop(context);
      }
    } on FirebaseAuthException catch (ex) {
      showSnackAlert(
        context: context,
        status: SnackBarStatus.negative,
        exception: ex,
      );
    } finally {
      setState(() => _isLoading = false);
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
      body: SingleChildScrollView(
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
              ListView(
                shrinkWrap: true,
                children: [
                  Form(
                    key: _formKey,
                    child: SignUpFormFields(provider: bloc),
                  ),
                  BlocBuilder<SignUpBloc, SignUpState>(
                    builder: (context, state) {
                      return StyledCustomButton(
                        isLoading: _isLoading,
                        onPressed: () => _signUp(bloc.model),
                        content: const Text('Sign up'),
                      );
                    },
                  )
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
