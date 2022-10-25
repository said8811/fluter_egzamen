import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_1_exam/models/Coffeemodel.dart';
import 'package:google_fonts/google_fonts.dart';

class Shop extends StatefulWidget {
  const Shop({super.key});

  @override
  State<Shop> createState() => _ShopState();
}

class _ShopState extends State<Shop> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          padding: EdgeInsets.only(top: 20),
          width: double.infinity,
          height: MediaQuery.of(context).size.height,
          decoration: BoxDecoration(
            color: Color(0xff201520),
          ),
          child: Column(
            children: [
              Container(
                height: 340,
                padding: EdgeInsets.symmetric(horizontal: 15),
                child: ListView.separated(
                    separatorBuilder: ((context, index) {
                      return SizedBox(
                        height: 20,
                      );
                    }),
                    itemCount: Coffee.orders.length,
                    itemBuilder: (context, index) {
                      return Dismissible(
                          key: Key(index.toString()),
                          direction: DismissDirection.endToStart,
                          background: Container(
                            color: Colors.red,
                            child: Center(
                              child: Icon(
                                Icons.delete,
                                color: Colors.white,
                                size: 32,
                              ),
                            ),
                          ),
                          onDismissed: (direction) {
                            if (direction == DismissDirection.endToStart) {
                              Coffee.orders.removeAt(index);
                            }
                          },
                          child: order(Coffee.orders[index]));
                    }),
              ),
              Image(
                image: AssetImage("assets/images/cofee.png"),
                height: 260,
                width: 350,
              ),
              Expanded(
                child: Container(
                  height: 150,
                  decoration: BoxDecoration(
                      gradient: LinearGradient(
                          begin: Alignment.bottomCenter,
                          end: Alignment.topCenter,
                          colors: [Color(0xffC69D65), Color(0xff201520)])),
                  child: Center(
                    child: Text(
                      "Enjoy your coffee",
                      style: GoogleFonts.rosarivo(
                          color: Color(0xffC69D65), fontSize: 18),
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  Widget order(Coffee coffee) {
    return Container(
      padding: EdgeInsets.all(14),
      decoration: BoxDecoration(
          color: Colors.white.withOpacity(0.1),
          borderRadius: BorderRadius.circular(15)),
      width: double.infinity,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              Image.asset(
                coffee.imgUrl,
                width: 72,
              ),
              SizedBox(
                width: 10,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Coppucino",
                    style:
                        GoogleFonts.rosarivo(color: Colors.white, fontSize: 16),
                  ),
                  Text(
                    coffee.name,
                    style:
                        GoogleFonts.rosarivo(color: Colors.white, fontSize: 12),
                  ),
                  Text(
                    "₹${coffee.cost}",
                    style: GoogleFonts.rosarivo(
                        color: Colors.white, fontWeight: FontWeight.bold),
                  )
                ],
              ),
            ],
          ),
          Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(12),
              color: Colors.white.withOpacity(0.1),
            ),
            child: Row(
              children: [
                InkWell(
                  onTap: () {
                    setState(() {
                      if (coffee.itemcount != 1) {
                        coffee.itemcount -= 1;
                      }
                    });
                  },
                  child: Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(12),
                      color: Color(0xffEFE3C8),
                    ),
                    width: 30,
                    height: 30,
                    child: Center(
                        child: Image.asset(
                      'assets/images/minus.png',
                      width: 10,
                    )),
                  ),
                ),
                SizedBox(
                  width: 8,
                ),
                Text(
                  coffee.itemcount.toString(),
                  style: GoogleFonts.rosarivo(color: Colors.white),
                ),
                SizedBox(
                  width: 8,
                ),
                InkWell(
                  onTap: () {
                    setState(() {
                      coffee.itemcount += 1;
                    });
                  },
                  child: Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(12),
                      color: Color(0xffEFE3C8),
                    ),
                    width: 30,
                    height: 30,
                    child: Center(
                        child: Image.asset(
                      'assets/images/plus.png',
                      width: 10,
                    )),
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
