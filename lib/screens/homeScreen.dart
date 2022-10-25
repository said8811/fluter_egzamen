import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_1_exam/screens/favorites.dart';
import 'package:flutter_1_exam/screens/homepage.dart';
import 'package:flutter_1_exam/screens/shop.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

List _pages = [
  HomePage(),
  Shop(),
  Favorites(),
  HomePage(),
];
int selectedindex = 0;

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _pages[selectedindex],
      bottomNavigationBar: BottomNavigationBar(
          onTap: (item) {
            setState(() {
              selectedindex = item;
            });
          },
          type: BottomNavigationBarType.fixed,
          currentIndex: selectedindex,
          selectedItemColor: Color(0xffEFE3C8),
          unselectedItemColor: Color(0xffEFE3C8).withOpacity(0.5),
          backgroundColor: Colors.black,
          items: [
            BottomNavigationBarItem(
                icon: Icon(Icons.home_rounded),
                label: "",
                backgroundColor: Colors.black),
            BottomNavigationBarItem(
                icon: Icon(Icons.shopping_cart_rounded), label: ""),
            BottomNavigationBarItem(icon: Icon(Icons.favorite), label: ""),
            BottomNavigationBarItem(
                icon: Icon(Icons.notifications_outlined), label: "")
          ]),
    );
  }
}
