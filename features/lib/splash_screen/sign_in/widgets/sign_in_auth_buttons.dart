import 'package:components/design_components.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';

class SignInAuthButtons extends StatelessWidget {
  const SignInAuthButtons({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final FirebaseAuth _auth = FirebaseAuth.instance;
    final GoogleSignIn _googleSignIn = GoogleSignIn();

    Future signInWithGoogle() async {
      try {
      // Realiza o login com o Google
        final googleSignInAccount = await _googleSignIn.signIn();
        final googleSignInAuthentication =
            await googleSignInAccount!.authentication;

        // Obtém as credenciais do Google
        final AuthCredential credential = GoogleAuthProvider.credential(
          accessToken: googleSignInAuthentication.accessToken,
          idToken: googleSignInAuthentication.idToken,
        );

        // Autentica com o Firebase usando as credenciais do Google
        final UserCredential authResult =
            await FirebaseAuth.instance.signInWithCredential(credential);

        // Retorna as informações do usuário autenticado
        return authResult;
      } on FirebaseAuthException catch (e) {
        print(e.message);
      }
    }

    return Wrap(
      alignment: WrapAlignment.center,
      runSpacing: 4,
      children: [
        StyledAuthButton(
          label: "Continue with Google",
          onPressed: signInWithGoogle,
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
    );
  }
}
