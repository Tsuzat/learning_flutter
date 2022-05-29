class CatalogModel {
  static List<Item> items = [];
}

class Item {
  final int id;
  final String title;
  final String desc;
  final num price;
  final String image;

  Item(
      {required this.id,
      required this.title,
      required this.desc,
      required this.price,
      required this.image});

  factory Item.fromMap(Map<String, dynamic> mp) {
    return Item(
        id: mp['id'],
        title: mp['title'],
        desc: mp['desc'],
        price: mp['price'],
        image: mp['image']);
  }
  toMap() =>
      {"id": id, "title": title, "desc": desc, "prices": price, "image": image};
}
