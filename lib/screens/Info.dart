import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_1_exam/models/Coffeemodel.dart';
import 'package:google_fonts/google_fonts.dart';

class Info extends StatefulWidget {
  Coffee coffee;
  Info({super.key, required this.coffee});

  @override
  State<Info> createState() => _InfoState();
}

String chosen = "";

class _InfoState extends State<Info> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: Container(
        padding: EdgeInsets.all(20),
        decoration: BoxDecoration(
          color: Color(0xff201520),
        ),
        width: double.infinity,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Stack(children: [
              Container(
                width: double.infinity,
                height: 400,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(35),
                    image: DecorationImage(
                        image: AssetImage(widget.coffee.imgUrl),
                        fit: BoxFit.cover)),
              ),
              ElevatedButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                child: Icon(Icons.arrow_back),
                style: ElevatedButton.styleFrom(
                    shape: CircleBorder(), backgroundColor: Colors.white12),
              ),
            ]),
            SizedBox(
              height: 10,
            ),
            Text(
              "Coppucino",
              style: GoogleFonts.rosarivo(fontSize: 20, color: Colors.white),
            ),
            Row(
              children: [
                Text(
                  widget.coffee.name,
                  style: GoogleFonts.rosarivo(color: Colors.white),
                ),
                SizedBox(
                  width: 25,
                ),
                Image.asset(
                  'assets/images/4.5.png',
                  height: 20,
                ),
              ],
            ),
            Text(
              "A single espresso shot poured into hot foamy milk, with the surface topped with mildly sweetened cocoa powder and drizzled with scrumptious caramel syrup ... Read More",
              style: TextStyle(
                  fontWeight: FontWeight.w500,
                  color: Colors.white,
                  fontSize: 16),
            ),
            SizedBox(
              height: 20,
            ),
            Text(
              "Choice of Milk",
              style: GoogleFonts.rosarivo(fontSize: 18, color: Colors.white),
            ),
            SizedBox(
              height: 20,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                InkWell(
                  onTap: () {
                    setState(() {
                      chosen = 'oat';
                    });
                  },
                  child: Container(
                    padding: EdgeInsets.all(8),
                    height: 40,
                    decoration: BoxDecoration(
                        color: chosen == "oat"
                            ? Color(0xffEFE3C8)
                            : Colors.transparent,
                        border: Border.all(width: 2, color: Color(0xffEFE3C8)),
                        borderRadius: BorderRadius.circular(10)),
                    child: Text(
                      "Oat Milk",
                      style: GoogleFonts.rosarivo(
                          color: chosen == "oat"
                              ? Colors.black
                              : Color(0xffEFE3C8)),
                    ),
                  ),
                ),
                InkWell(
                  onTap: () {
                    setState(() {
                      chosen = "soy";
                    });
                  },
                  child: Container(
                    padding: EdgeInsets.all(8),
                    height: 40,
                    decoration: BoxDecoration(
                        color: chosen == "soy"
                            ? Color(0xffEFE3C8)
                            : Colors.transparent,
                        border: Border.all(width: 2, color: Color(0xffEFE3C8)),
                        borderRadius: BorderRadius.circular(10)),
                    child: Text(
                      "Soy Milk",
                      style: GoogleFonts.rosarivo(
                          color: chosen == "soy"
                              ? Colors.black
                              : Color(0xffEFE3C8)),
                    ),
                  ),
                ),
                InkWell(
                  onTap: () {
                    setState(() {
                      chosen = "almont";
                    });
                  },
                  child: Container(
                    padding: EdgeInsets.all(8),
                    height: 40,
                    decoration: BoxDecoration(
                        color: chosen == "almont"
                            ? Color(0xffEFE3C8)
                            : Colors.transparent,
                        border: Border.all(width: 2, color: Color(0xffEFE3C8)),
                        borderRadius: BorderRadius.circular(10)),
                    child: Text(
                      "Almond Milk",
                      style: GoogleFonts.rosarivo(
                          color: chosen == "almont"
                              ? Colors.black
                              : Color(0xffEFE3C8)),
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 20,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  children: [
                    Text(
                      "Price",
                      style: GoogleFonts.rosarivo(
                          fontSize: 14, color: Colors.white),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Text(
                      "₹${widget.coffee.cost}",
                      style: GoogleFonts.rosarivo(
                          fontSize: 20, color: Colors.white),
                    )
                  ],
                ),
                Container(
                  height: 50,
                  width: 250,
                  decoration: BoxDecoration(
                      color: Color(0xffEFE3C8),
                      borderRadius: BorderRadius.circular(10)),
                  child: Center(
                    child: Text("BUY NOW"),
                  ),
                )
              ],
            )
          ],
        ),
      )),
    );
  }
}
