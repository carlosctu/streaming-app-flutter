import 'package:features/home/bloc/home_bloc.dart';
import 'package:features/home/home.dart';
import 'package:features/home/repository/home_repository.dart';
import 'package:features/splash_screen/sign_in/bloc/sign_in_bloc.dart';
import 'package:features/splash_screen/sign_in/repository/sign_in_repository.dart';
import 'package:features/splash_screen/sign_in/sign_in_page.dart';
import 'package:features/splash_screen/sign_up/bloc/sign_up_bloc.dart';
import 'package:features/splash_screen/sign_up/repository/sign_up_repository.dart';
import 'package:features/splash_screen/sign_up/sign_up_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

Route<dynamic>? onGenerateRoute(settings) {
  if (settings.name == SignInPage.route) {
    return PageRouteBuilder(
      pageBuilder: (BuildContext context, Animation<double> animation,
              Animation<double> secondaryAnimation) =>
          RepositoryProvider(
        create: (BuildContext context) => SignInRepository(),
        child: BlocProvider(
          create: (context) =>
              SignInBloc(RepositoryProvider.of<SignInRepository>(context)),
          child: const SignInPage(),
        ),
      ),
    );
  } else if (settings.name == SignUpPage.route) {
    return MaterialPageRoute(
      builder: (BuildContext context) => RepositoryProvider(
        create: (BuildContext context) => SignUpRepository(),
        child: BlocProvider(
          create: (context) =>
              SignUpBloc(RepositoryProvider.of<SignUpRepository>(context)),
          child: const SignUpPage(),
        ),
      ),
    );
  } else if (settings.name == "/home") {
    return MaterialPageRoute(
      builder: (BuildContext context) => RepositoryProvider(
        create: (context) => HomeRepository(),
        child: BlocProvider(
          create: (context) =>
              HomeBloc(RepositoryProvider.of<HomeRepository>(context)),
          child: const Home(),
        ),
      ),
    );
  }
  return null;
}
