import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_1_exam/screens/Info.dart';
import 'package:flutter_1_exam/screens/homeScreen.dart';
import 'package:flutter_1_exam/screens/shop.dart';
import 'package:flutter_1_exam/screens/sign_in.dart';
import 'package:flutter_1_exam/screens/sign_up.dart';
import 'package:flutter_1_exam/screens/splash.dart';

abstract class RouteName {
  static const splash = '/splash';
  static const signin = '/signin';
  static const signup = '/signup';
  static const home = '/';
  static const info = '/info';
  static const shop = '/shop';
}

class AppRoutes {
  static Route generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case RouteName.splash:
        return MaterialPageRoute(builder: (_) => Splash());
      case RouteName.signin:
        return MaterialPageRoute(builder: (_) => SignIn());
      case RouteName.signup:
        return MaterialPageRoute(builder: (_) => SignUp());
      case RouteName.home:
        return MaterialPageRoute(builder: (_) => HomeScreen());
      case RouteName.shop:
        return MaterialPageRoute(builder: (_) => Shop());
      case RouteName.info:
        final args = settings.arguments as Map<String, dynamic>;
        return MaterialPageRoute(
          builder: (_) => Info(
            coffee: args['cofe'],
          ),
        );
      default:
        return MaterialPageRoute(builder: (_) => Scaffold());
    }
  }
}
