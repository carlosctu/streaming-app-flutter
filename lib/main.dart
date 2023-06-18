import 'package:features/anime_page/bloc/anime_page_bloc.dart';
import 'package:features/anime_page/repository/anime_page_repository.dart';
import 'package:features/home/bloc/home_bloc.dart';
import 'package:features/home/repository/home_repository.dart';
import 'package:features/routes/routes.dart';
import 'package:features/splash_screen/services/authentication_service.dart';
import 'package:features/splash_screen/sign_in/bloc/sign_in_bloc.dart';
import 'package:features/splash_screen/sign_in/repository/sign_in_repository.dart';
import 'package:features/splash_screen/sign_up/bloc/sign_up_bloc.dart';
import 'package:features/splash_screen/sign_up/repository/sign_up_repository.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:streaming_app_flutter/hive_config.dart';
import 'firebase_options.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await HiveConfig.start();
  await dotenv.load(fileName: ".env");
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiRepositoryProvider(
      providers: [
        RepositoryProvider<SignInRepository>(
          create: (context) => SignInRepository(
            AuthenticationService(),
          ),
        ),
        RepositoryProvider<SignUpRepository>(
          create: (context) => SignUpRepository(),
        ),
        RepositoryProvider<HomeRepository>(
          create: (context) => HomeRepository(),
        ),
        RepositoryProvider<AnimePageRepository>(
          create: (context) => AnimePageRepository(),
        ),
      ],
      child: MultiBlocProvider(
        providers: [
          BlocProvider<SignInBloc>(
            create: (context) => SignInBloc(
              context.read<SignInRepository>(),
            ),
          ),
          BlocProvider<SignUpBloc>(
            create: (context) => SignUpBloc(
              context.read<SignUpRepository>(),
            ),
          ),
          BlocProvider<HomeBloc>(
            create: (context) => HomeBloc(
              context.read<HomeRepository>(),
            ),
          ),
          BlocProvider<AnimePageBloc>(
            create: (context) => AnimePageBloc(
              context.read<AnimePageRepository>(),
            ),
          ),
        ],
        child: const MaterialApp(
          debugShowCheckedModeBanner: false,
          initialRoute: "/",
          onGenerateRoute: onGenerateRoute,
        ),
      ),
    );
  }
}
