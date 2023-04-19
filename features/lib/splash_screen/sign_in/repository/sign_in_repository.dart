import 'package:features/shared/firebase/error_validations.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:flutter/foundation.dart'
    show defaultTargetPlatform, kIsWeb, TargetPlatform;
import 'package:twitter_login/twitter_login.dart';

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

  //Email SignIn()
  Future emailSignIn({required String email, required String password}) async {
    try {
      return await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: email,
        password: password,
      );
    } on FirebaseAuthException catch (ex) {
      print(ex);
      firebaseErrorValidation(ex);
    } catch (e) {
      print(e);
      throw Exception(defaultMessage);
    }
  }

  //Twitter SignIn()
  Future twitterSignIn() async {
    try {
      final twitterLogin = TwitterLogin(
        apiKey: dotenv.env['API_KEY_TWITTER']!,
        apiSecretKey: dotenv.env['API_SECRET_KEY_TWITTER']!,
        redirectURI: 'socialauth://',
      );
      final auth = await twitterLogin.loginV2();

      if (auth.status != TwitterLoginStatus.loggedIn) {
        throw Exception(defaultMessage);
      }

      final credential = TwitterAuthProvider.credential(
        accessToken: auth.authToken!,
        secret: auth.authTokenSecret!,
      );
      final userCredential =
          await FirebaseAuth.instance.signInWithCredential(credential);

      return userCredential;
    } on FirebaseAuthException catch (ex) {
      print(ex);
      firebaseErrorValidation(ex);
    } catch (e) {
      print(e);
      throw Exception(defaultMessage);
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
    } on FirebaseAuthException catch (ex) {
      print(ex);
      firebaseErrorValidation(ex);
    } catch (e) {
      print(e);
      throw Exception(defaultMessage);
    }
  }
}
