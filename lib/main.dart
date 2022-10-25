import 'package:flutter/material.dart';
import 'package:flutter_1_exam/screens/splash.dart';
import 'package:flutter_1_exam/util/app_routes.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      initialRoute: RouteName.splash,
      onGenerateRoute: AppRoutes.generateRoute,
    );
  }
}
