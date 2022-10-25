import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_1_exam/models/favoritesmodel.dart';
import 'package:google_fonts/google_fonts.dart';

class Favorites extends StatefulWidget {
  const Favorites({super.key});

  @override
  State<Favorites> createState() => _FavoritesState();
}

class _FavoritesState extends State<Favorites> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        physics: BouncingScrollPhysics(),
        child: Container(
            color: Color(0xff201520),
            width: double.infinity,
            padding: EdgeInsets.symmetric(horizontal: 20, vertical: 30),
            child: Column(
              children: [
                Container(
                  height: MediaQuery.of(context).size.height * 0.9,
                  child: ListView.separated(
                      primary: false,
                      physics: BouncingScrollPhysics(),
                      separatorBuilder: ((context, index) {
                        return SizedBox(
                          height: 30,
                        );
                      }),
                      shrinkWrap: true,
                      itemCount: Slides.slides.length,
                      itemBuilder: (context, index) {
                        return Slideitem(Slides.slides[index]);
                      }),
                )
              ],
            )),
      ),
    );
  }

  Widget Slideitem(Slides slides) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 30),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(25),
          image: DecorationImage(
              image: AssetImage(slides.imgurl), fit: BoxFit.cover)),
      height: 160,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(
            slides.Name,
            style: GoogleFonts.solway(fontSize: 30, color: Colors.white),
          ),
          Text(
            slides.desc,
            style: TextStyle(
              color: Colors.white,
              fontSize: 18,
            ),
            textAlign: TextAlign.center,
          ),
          SizedBox(
            height: 30,
          )
        ],
      ),
    );
  }
}
