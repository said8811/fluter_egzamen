import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_1_exam/screens/homeScreen.dart';
import 'package:flutter_1_exam/screens/homepage.dart';
import 'package:flutter_1_exam/screens/sign_up.dart';
import 'package:flutter_1_exam/screens/splash.dart';
import 'package:flutter_1_exam/util/app_routes.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SignIn extends StatefulWidget {
  const SignIn({super.key});

  @override
  State<SignIn> createState() => _SignInState();
}

class _SignInState extends State<SignIn> {
  String vl = "";
  String v2 = "";
  bool visible = true;
  final _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: SingleChildScrollView(
        child: Container(
          height: MediaQuery.of(context).size.height,
          padding: EdgeInsets.symmetric(horizontal: 40, vertical: 70),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    height: 10,
                  ),
                  Text(
                    "Sign in",
                    style: GoogleFonts.poppins(
                        fontWeight: FontWeight.w500, fontSize: 22),
                  ),
                  SizedBox(
                    height: 14,
                  ),
                  Text(
                    "Welcome back",
                    style: GoogleFonts.poppins(
                        fontWeight: FontWeight.w400, color: Colors.grey),
                  ),
                  SizedBox(
                    height: 40,
                  ),
                  Form(
                      key: _formKey,
                      child: Column(
                        children: [
                          TextFormField(
                            validator: (value) {
                              vl = value ?? "";
                              return value!.isEmpty
                                  ? "Please enter your email"
                                  : "";
                            },
                            decoration: InputDecoration(
                              hintText: "Email adress",
                              prefixIcon: Row(
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  SizedBox(
                                    width: 5,
                                  ),
                                  Icon(
                                    Icons.mail_outline_rounded,
                                    size: 23,
                                  ),
                                  Image.asset(
                                    "assets/images/centerborder.png",
                                    height: 30,
                                    width: 10,
                                  ),
                                ],
                              ),
                            ),
                          ),
                          SizedBox(
                            height: 30,
                          ),
                          TextFormField(
                            obscureText: visible,
                            validator: (value) {
                              v2 = value ?? "";
                              return value!.isEmpty
                                  ? "Please write the password"
                                  : "";
                            },
                            decoration: InputDecoration(
                              hintText: "Password",
                              suffixIcon: visible
                                  ? IconButton(
                                      onPressed: () {
                                        setState(() {
                                          visible = !visible;
                                        });
                                      },
                                      icon: Icon(Icons.visibility_outlined))
                                  : IconButton(
                                      onPressed: () {
                                        setState(() {
                                          visible = !visible;
                                        });
                                      },
                                      icon:
                                          Icon(Icons.visibility_off_outlined)),
                              prefixIcon: Row(
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  const SizedBox(
                                    width: 5,
                                  ),
                                  const Icon(
                                    Icons.lock_outline_rounded,
                                    size: 23,
                                  ),
                                  Image.asset(
                                    "assets/images/centerborder.png",
                                    height: 30,
                                    width: 10,
                                  ),
                                ],
                              ),
                            ),
                          ),
                          const SizedBox(
                            height: 15,
                          ),
                          Text(
                            "Forgot Password?",
                            style:
                                GoogleFonts.poppins(color: Color(0xff324A59)),
                          ),
                          const SizedBox(
                            height: 134,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              Container(
                                width: 64,
                                height: 64,
                                child: ElevatedButton(
                                    style: ElevatedButton.styleFrom(
                                      backgroundColor: Color(0xff324A59),
                                      shape: CircleBorder(),
                                    ),
                                    onPressed: () {
                                      _formKey.currentState!.validate();
                                      if (vl.length > 0 && v2.length > 0) {
                                        saveLogin();
                                        Navigator.pushNamed(
                                            context, RouteName.home);
                                      }
                                    },
                                    child: const Icon(
                                      Icons.arrow_forward_rounded,
                                      size: 30,
                                    )),
                              ),
                            ],
                          )
                        ],
                      )),
                ],
              ),
              Row(
                children: [
                  Text(
                    "New member? ",
                    style: GoogleFonts.poppins(color: Colors.grey),
                  ),
                  InkWell(
                    splashColor: Colors.white,
                    onTap: () {
                      Navigator.pushNamed(context, RouteName.signup);
                    },
                    child: Text(
                      "Sign Up",
                      style: GoogleFonts.poppins(fontWeight: FontWeight.w500),
                    ),
                  ),
                ],
              )
            ],
          ),
        ),
      )),
    );
  }

  void saveLogin() async {
    SharedPreferences _pref = await SharedPreferences.getInstance();
    _pref.setBool("isLoggedIn", true);
  }
}
