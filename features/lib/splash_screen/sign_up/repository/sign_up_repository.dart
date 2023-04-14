import 'package:firebase_auth/firebase_auth.dart';

class SignUpRepository {
  final _auth = FirebaseAuth.instance;
  Future signUpWithEmailAndPassword({
    required String email,
    required String password,
  }) async {
    try {
      await _auth.createUserWithEmailAndPassword(
          email: email, password: password);
    } on FirebaseAuthException catch (ex) {
      switch (ex.code) {
        case "email-already-in-use":
          throw Exception(ex.message);
        case "operation-not-allowed":
          throw Exception(
              "Can't not create and account with that email. Please try another or contact us");
        default:
          throw Exception("Please try again later");
      }
    } catch (ex) {
      throw (ex.toString());
    }
  }
}
