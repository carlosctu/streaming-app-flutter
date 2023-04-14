import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:flutter/foundation.dart'
    show defaultTargetPlatform, kIsWeb, TargetPlatform;

class SignInRepository {
  final defaultMessage = "Sorry, we couldn't sign you in";

  String get clientId {
    if (kIsWeb) {
      throw UnsupportedError(
        'DefaultFirebaseOptions have not been configured for web - '
        'you can reconfigure this by running the FlutterFire CLI again.',
      );
    }
    switch (defaultTargetPlatform) {
      case TargetPlatform.android:
        return dotenv.env['']!;
      case TargetPlatform.iOS:
        return dotenv.env['IOS_CLIENT_ID']!;
      default:
        throw UnsupportedError(
          'DefaultFirebaseOptions are not supported for this platform.',
        );
    }
  }

  // Google SignIn()
  Future googleSignIn() async {
    try {
      // Creates a new instances of GoogleSignIn with the current platform iOS or Android
      GoogleSignIn googleSignin = GoogleSignIn(clientId: clientId);

      // SignIn process
      final GoogleSignInAccount? gUser = await googleSignin.signIn();

      // Validates if user choosed an account or cancel the request;
      if (gUser == null) throw Exception(defaultMessage);

      // Get authentications from request;
      final GoogleSignInAuthentication auth = await gUser.authentication;

      // Create a new credential for the user
      final credential = GoogleAuthProvider.credential(
        accessToken: auth.accessToken,
        idToken: auth.idToken,
      );

      // Return the SignIn data
      return FirebaseAuth.instance.signInWithCredential(credential);
    } on FirebaseAuthException catch (e) {
      throw Exception(e);
    } catch (e) {
      print(e);
      throw Exception(defaultMessage);
    }
  }
}
