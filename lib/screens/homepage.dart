import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_1_exam/models/Coffeemodel.dart';
import 'package:flutter_1_exam/models/brewitems.dart';
import 'package:flutter_1_exam/screens/Info.dart';
import 'package:flutter_1_exam/util/app_routes.dart';
import 'package:google_fonts/google_fonts.dart';

import 'package:http/http.dart' as http;
import 'dart:convert' as convert;

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List getData() {
    return Coffee.coffees;
  }

  int selecteditem = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
            padding: EdgeInsets.only(top: 40),
            decoration: BoxDecoration(color: Color(0xff201520)),
            width: double.infinity,
            child: Column(
              children: [
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 20),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "déjà",
                            style: GoogleFonts.rosarivo(
                                fontSize: 36,
                                color: Color(0xffEFE3C880).withOpacity(0.5)),
                          ),
                          Text(
                            " Brew",
                            style: GoogleFonts.rosarivo(
                                fontSize: 48, color: Color(0xffEFE3C880)),
                          ),
                        ],
                      ),
                      Image.asset(
                        "assets/images/person.png",
                        width: 70,
                      )
                    ],
                  ),
                ),
                SizedBox(
                  height: 50,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 30),
                  child: Container(
                    height: 54,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(15),
                      color: Color(0xff171017),
                    ),
                    child: TextField(
                      style: GoogleFonts.rosarivo(color: Color(0xffEFE3C880)),
                      decoration: InputDecoration(
                          prefixIcon: Icon(
                            Icons.search,
                            color: Color(0xffEFE3C880),
                          ),
                          hintText: "Browse your favorite coffee",
                          hintStyle:
                              GoogleFonts.rosarivo(color: Color(0xffEFE3C880)),
                          fillColor: Color(0xffEFE3C880),
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(15)),
                          focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(15),
                              borderSide:
                                  BorderSide(color: Color(0xffEFE3C880)))),
                    ),
                  ),
                ),
                SizedBox(
                  height: 40,
                ),
                FutureBuilder(
                  builder: (context, snapshot) {
                    return Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.only(
                                topRight: Radius.circular(40)),
                            color: Colors.brown.withOpacity(0.5),
                          ),
                          height: 550,
                          width: 40,
                          child: RotatedBox(
                            quarterTurns: 3,
                            child: DefaultTabController(
                              length: 5,
                              child: TabBar(
                                  indicatorColor: Colors.brown.withOpacity(0.0),
                                  tabs: [
                                    Tab(
                                      child: Text(
                                        "Flat white",
                                        style: GoogleFonts.rosarivo(),
                                      ),
                                    ),
                                    Tab(
                                      child: Text(
                                        "Espreso",
                                        style: GoogleFonts.rosarivo(),
                                      ),
                                    ),
                                    Tab(
                                      child: Text("American",
                                          style: GoogleFonts.rosarivo()),
                                    ),
                                    Tab(
                                      child: Text("Latte",
                                          style: GoogleFonts.rosarivo()),
                                    ),
                                    Tab(
                                      child: Text("Copucino",
                                          style: GoogleFonts.rosarivo()),
                                    ),
                                  ]),
                            ),
                          ),
                        ),
                        SizedBox(
                          width: 20,
                        ),
                        Expanded(
                          child: GridView.builder(
                              primary: false,
                              shrinkWrap: true,
                              gridDelegate:
                                  SliverGridDelegateWithFixedCrossAxisCount(
                                      crossAxisCount: 2,
                                      mainAxisSpacing: 15,
                                      mainAxisExtent: 256,
                                      crossAxisSpacing: 10),
                              itemCount: Coffee.coffees.length,
                              itemBuilder: ((context, index) {
                                return coffee(Coffee.coffees[index]);
                              })),
                        ),
                      ],
                    );
                  },
                )
              ],
            )),
      ),
    );
  }

  Widget coffee(Coffee cofe) {
    return InkWell(
      onTap: () {
        Navigator.pushNamed(context, RouteName.info, arguments: {"cofe": cofe});
      },
      child: Container(
        decoration: BoxDecoration(
            color: Colors.white.withOpacity(0.1),
            borderRadius: BorderRadius.circular(25)),
        padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Stack(children: [
                  Image(
                    image: AssetImage(cofe.imgUrl),
                  ),
                  Positioned(
                    top: 0,
                    left: 0,
                    child: Container(
                        padding: EdgeInsets.all(1),
                        decoration: BoxDecoration(
                            color: Colors.white.withOpacity(0.1),
                            borderRadius: BorderRadius.only(
                                topLeft: Radius.circular(15),
                                bottomRight: Radius.circular(15))),
                        child: Image.asset(
                          'assets/images/4.5.png',
                          width: 40,
                        )),
                  )
                ]),
                Text(
                  cofe.name,
                  style:
                      GoogleFonts.rosarivo(color: Colors.white, fontSize: 18),
                ),
              ],
            ),
            Container(
              height: 38,
              decoration: BoxDecoration(
                  color: Colors.white.withOpacity(0.08),
                  borderRadius: BorderRadius.circular(14)),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Center(
                    child: Text(
                      "₹${cofe.cost}",
                      style: TextStyle(color: Colors.white, fontSize: 19),
                    ),
                  ),
                  SizedBox(
                    width: 20,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      InkWell(
                        onTap: () {
                          if (Coffee.orders.contains(cofe) == false) {
                            Coffee.orders.add(cofe);
                          }
                        },
                        child: Container(
                            width: 40,
                            decoration: BoxDecoration(
                                color: Color(0xffEFE3C8),
                                borderRadius: BorderRadius.circular(14)),
                            padding: EdgeInsets.all(10),
                            child: Image.asset(
                              "assets/images/plus.png",
                              width: 20,
                            )),
                      ),
                    ],
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
