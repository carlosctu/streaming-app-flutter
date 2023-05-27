import 'package:features/anime_page/anime_page.dart';
import 'package:features/home/home_page.dart';
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
    return MaterialPageRoute(
      builder: (BuildContext context) => const SignUpPage(),
    );
  } else if (settings.name == "/home") {
    return MaterialPageRoute(
      builder: (BuildContext context) => const HomePage(),
    );
  } else if (settings.name == "/anime") {
    final arguments = settings.arguments as AnimePageArguments;
    return MaterialPageRoute(
      builder: (context) => AnimePage(args: arguments),
    );
  }
  return null;
}
