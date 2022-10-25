import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_1_exam/screens/sign_in.dart';
import 'package:google_fonts/google_fonts.dart';

class Splash extends StatefulWidget {
  const Splash({super.key});

  @override
  State<Splash> createState() => _SplashState();
}

class _SplashState extends State<Splash> {
  @override
  void initState() {
    super.initState();
    _nextpage();
  }

  _nextpage() async {
    Future.delayed(Duration(seconds: 3)).then((value) =>
        Navigator.push(context, MaterialPageRoute(builder: (_) => SignIn())));
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
