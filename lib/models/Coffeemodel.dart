class Coffee {
  String name;
  String imgUrl;
  String cost;
  int itemcount;
  Coffee(
      {required this.name,
      required this.imgUrl,
      required this.cost,
      this.itemcount = 1});

  static List coffees = [
    Coffee(
        name: "Cinnamon & Cocoa", imgUrl: "assets/images/c1.png", cost: "99"),
    Coffee(
        name: "Drizzled with Caramel",
        imgUrl: "assets/images/c2.png",
        cost: "199"),
    Coffee(
        name: "Dalgona Whipped Macha",
        imgUrl: "assets/images/c3.png",
        cost: "249"),
    Coffee(
        name: "Bursting Blueberry",
        imgUrl: "assets/images/c4.png",
        cost: "299"),
  ];
  static List orders = [];
}
