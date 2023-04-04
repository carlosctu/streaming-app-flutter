import 'package:features/splash_screen/sign_in/sign_in_page.dart';
import 'package:features/splash_screen/sign_up/sign_up_page.dart';
import 'package:flutter/material.dart';

Route<dynamic>? onGenerateRoute(settings) {
  if (settings.name == SignInPage.route) {
    return PageRouteBuilder(
      pageBuilder: (BuildContext context, Animation<double> animation,
              Animation<double> secondaryAnimation) =>
          const SignInPage(),
    );
  } else if (settings.name == SignUpPage.route) {
    return PageRouteBuilder(
      pageBuilder: (BuildContext context, Animation<double> animation,
              Animation<double> secondaryAnimation) =>
          const SignUpPage(),
    );
    // } else if (settings.name == DetailsPage.route) {
    // final arguments = settings.arguments as CryptoDataArguments;
    // return DefaultPageRoute(
    // child: DetailsPage(cryptoDataArguments: arguments),
    // );
  }
  return null;
}
