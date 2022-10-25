import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_1_exam/screens/homepage.dart';
import 'package:flutter_1_exam/screens/sign_in.dart';
import 'package:flutter_1_exam/screens/splash.dart';
import 'package:flutter_1_exam/util/app_routes.dart';
import 'package:google_fonts/google_fonts.dart';

class SignUp extends StatefulWidget {
  const SignUp({super.key});

  @override
  State<SignUp> createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  String vl = "";
  String v2 = "";
  String v3 = "";
  String v4 = "";
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
                    "Sign up",
                    style: GoogleFonts.poppins(
                        fontWeight: FontWeight.w500, fontSize: 22),
                  ),
                  SizedBox(
                    height: 14,
                  ),
                  Text(
                    "Create an account here",
                    style: GoogleFonts.poppins(
                        fontWeight: FontWeight.w400, color: Colors.grey),
                  ),
                  SizedBox(
                    height: 40,
                  ),
                  Form(
                      key: _formKey,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          TextFormField(
                            validator: (value) {
                              v3 = value ?? "";
                              return value!.isEmpty
                                  ? "Please enter Username"
                                  : "";
                            },
                            decoration: InputDecoration(
                              hintText: "Username",
                              hintStyle: GoogleFonts.poppins(
                                  color: Color(0xffC1C7D0),
                                  fontWeight: FontWeight.w500),
                              prefixIcon: Row(
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  SizedBox(
                                    width: 5,
                                  ),
                                  Icon(
                                    Icons.person_outline_rounded,
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
                            keyboardType: TextInputType.number,
                            validator: (value) {
                              v4 = value ?? "";
                              return value!.isEmpty
                                  ? "Please enter your number"
                                  : "";
                            },
                            decoration: InputDecoration(
                              hintText: "Phone number",
                              hintStyle: GoogleFonts.poppins(
                                  color: Color(0xffC1C7D0),
                                  fontWeight: FontWeight.w500),
                              prefixIcon: Row(
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  SizedBox(
                                    width: 5,
                                  ),
                                  Icon(
                                    Icons.phone_iphone_rounded,
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
                            validator: (value) {
                              vl = value ?? "";
                              return value!.isEmpty
                                  ? "Please enter your email"
                                  : "";
                            },
                            decoration: InputDecoration(
                              hintText: "Email adress",
                              hintStyle: GoogleFonts.poppins(
                                  color: Color(0xffC1C7D0),
                                  fontWeight: FontWeight.w500),
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
                              hintStyle: GoogleFonts.poppins(
                                  color: Color(0xffC1C7D0),
                                  fontWeight: FontWeight.w500),
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
                                  SizedBox(
                                    width: 5,
                                  ),
                                  Icon(
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
                          SizedBox(
                            height: 15,
                          ),
                          Text(
                            "By signing up you agree with our Terms of Use",
                            style: GoogleFonts.poppins(
                                color: Color(0xff324A59), fontSize: 12),
                          ),
                          SizedBox(
                            height: 34,
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
                                      if (vl.length > 0 &&
                                          v2.length > 0 &&
                                          v3.length > 0 &&
                                          v4.length > 0) {
                                        Navigator.pushNamed(
                                            context, RouteName.home);
                                      }
                                    },
                                    child: Icon(
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
                    "Already a member? ",
                    style: GoogleFonts.poppins(color: Colors.grey),
                  ),
                  InkWell(
                    splashColor: Colors.white,
                    onTap: () {
                      Navigator.pushNamed(context, RouteName.signin);
                    },
                    child: Text(
                      "Sign in",
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
}
