class CatalogModel {
  static final items = [
    Item(
      id: 1,
      title: "Fjallraven Backpack",
      desc:
          "Your perfect pack for everyday use and walks in the forest. Stash your laptop (up to 15 inches) in the padded sleeve, your everyday",
      price: 109.95,
      color: "#33505a",
      image: "https://fakestoreapi.com/img/81fPKd-2AYL._AC_SL1500_.jpg",
    )
  ];
}

class Item {
  final int id;
  final String title;
  final String desc;
  final num price;
  final String color;
  final String image;

  Item(
      {required this.id,
      required this.title,
      required this.desc,
      required this.price,
      required this.color,
      required this.image});
}
