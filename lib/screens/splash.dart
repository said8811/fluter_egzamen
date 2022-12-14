import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_1_exam/screens/homeScreen.dart';
import 'package:flutter_1_exam/screens/sign_in.dart';
import 'package:flutter_1_exam/util/app_routes.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Splash extends StatefulWidget {
  const Splash({super.key});

  @override
  State<Splash> createState() => _SplashState();
}

class _SplashState extends State<Splash> {
  bool isLog = false;

  Future<bool> isLoggedIn() async {
    SharedPreferences _pref = await SharedPreferences.getInstance();
    isLog = _pref.getBool("isLoggedIn") ?? false;
    return _pref.getBool("isLoggedIn") ?? false;
  }

  @override
  void initState() {
    super.initState();
    isLoggedIn();
    _nextpage();
  }

  _nextpage() async {
    Future.delayed(Duration(seconds: 3)).then((value) => Navigator.pushNamed(
        context, isLog ? RouteName.home : RouteName.signin));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        decoration: BoxDecoration(
            image: DecorationImage(
                image: AssetImage('assets/images/splash.png'),
                fit: BoxFit.cover)),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image(
              image: AssetImage('assets/images/s_coffee.png'),
              width: 120,
            ),
            SizedBox(
              height: 15,
            ),
            Text(
              "Ordinary Coffee House",
              style: GoogleFonts.poppins(
                  fontSize: 24,
                  color: Colors.white,
                  fontWeight: FontWeight.w500),
            )
          ],
        ),
      ),
    );
  }
}
