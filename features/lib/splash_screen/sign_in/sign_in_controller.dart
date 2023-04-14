import 'package:features/splash_screen/firebase_options.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';

class SignInController extends ChangeNotifier {
  GoogleSignIn googleSignIn = GoogleSignIn(
      clientId: DefaultFirebaseOptions.currentPlatform.iosClientId);

  GoogleSignInAccount? _account;

  GoogleSignInAccount get account => _account!;

  Future googleLogin() async {
    // Metodo para fazer signIn com google e abrir o popUp
    final googleUser = await googleSignIn.signIn();

    // googleUser será null caso o usuário não escolha
    // nenhuma conta
    if (googleUser == null) return;

    //Caso tiver escolhido usuário, ele pega os dados e os guarda
    // dentro do _account
    _account = googleUser;

    // com o usuario, podemos fazer a autenticação

    final googleAuth = await googleUser.authentication;
    final credential = GoogleAuthProvider.credential(
      accessToken: googleAuth.accessToken,
      idToken: googleAuth.idToken,
    );
    await FirebaseAuth.instance.signInWithCredential(credential);

    // notifyListeners vai renderizar a UI
    // caso o usuário entre com credenciais
    notifyListeners();
  }
}
