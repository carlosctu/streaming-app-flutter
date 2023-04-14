import 'package:flutter/material.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  static const route = '/home';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: MaterialButton(
          child: const Text("Back to Splash Screen"),
          onPressed: () => Navigator.pop(context),
        ),
      ),
    );
  }
}
