class Slides {
  String Name;
  String desc;
  String imgurl;
  Slides({required this.Name, required this.desc, required this.imgurl});

  static List slides = [
    Slides(
        Name: "Hot Coffee",
        desc: "Enjoy your hot coffee with a nice morning",
        imgurl: "assets/images/hotcoffee.png"),
    Slides(
        Name: "Ice Coffee",
        desc:
            "Cold coffee, a feeling of freshness and recharge of the body's activity",
        imgurl: "assets/images/Icecoffee.png"),
    Slides(
        Name: "Snacks",
        desc: "Enjoy your hot coffee with a nice morning",
        imgurl: "assets/images/snacks.png"),
    Slides(
        Name: "Sweet",
        desc: "You need sweet to relieve the stress of work and study",
        imgurl: "assets/images/Sweet.png")
  ];
}
