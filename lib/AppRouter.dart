import 'package:flutter/material.dart';
import 'package:trilicious_mvp/HomePage.dart';
import 'package:trilicious_mvp/screens/login/login_screen.dart';

class AppRouter {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case LoginScreen.id:
        return MaterialPageRoute<Widget>(
            builder: (BuildContext context) => const LoginScreen());
      case HomePage.id:
        return MaterialPageRoute<Widget>(
            builder: (BuildContext context) => const HomePage());
      default:
        return MaterialPageRoute<Widget>(
          builder: (_) => const Center(
            child: Text('Unimplemented Route'),
          ),
        );
    }
  }
}
