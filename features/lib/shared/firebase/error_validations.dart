import 'package:firebase_auth/firebase_auth.dart';

String firebaseErrorValidation(FirebaseAuthException ex) {
  switch (ex.code) {
    case "wrong-password":
      throw Exception(ex.message);
    case "too-many-requests":
      throw Exception(ex.message);
    case "user-not-found":
      throw Exception("User not found");
    case "email-already-in-use":
      throw Exception(ex.message);
    case "account-exists-with-different-credential":
      throw Exception(ex.message);
    case "operation-not-allowed":
      throw Exception(
          "Can't not create and account with that email. Please try another or contact us");
    default:
      throw Exception("Something went wrong. Please try again later");
  }
}
