import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

enum SnackBarStatus { positive, negative }

class SignUpPageMixin {
  void showSnackAlert({
    required BuildContext context,
    required SnackBarStatus status,
    FirebaseAuthException? exception,
  }) {
    String snackMessage = "Account sucessfuly created!.";
    if (status == SnackBarStatus.negative) {
      switch (exception!.code) {
        case "email-already-in-use":
          snackMessage = exception.message ?? snackMessage;
          break;
        case "operation-not-allowed":
          snackMessage =
              "Can't not create and account with that email. Please try another or contact us";
          break;
        default:
          snackMessage = "Please try again later";
      }
    }
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(snackMessage),
        duration: const Duration(seconds: 4),
        backgroundColor: status == SnackBarStatus.positive
            ? const Color(0xff408140)
            : const Color(0xffD93B41),
        action: SnackBarAction(
          label: 'X',
          textColor: Colors.white,
          onPressed: () => ScaffoldMessenger.of(context).hideCurrentSnackBar(),
        ),
      ),
    );
  }
}
