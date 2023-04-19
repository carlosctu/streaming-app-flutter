import 'package:features/shared/firebase/error_validations.dart';
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
      print(ex);
      firebaseErrorValidation(ex);
    } catch (ex) {
      throw (ex.toString());
    }
  }
}
