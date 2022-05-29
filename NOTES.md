## Branch Day15

JSON Mapping, Data Class Generator and ProgressIndicator (A real life problem)

### JSON Mapping

Mapping the data that we got from JSON `catalog.json` is a real challenge. This data could be fetched in real time from backend or could be loaded from a local file (as we're doing here)

The `Item` class has been added new methods.
```dart
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
``` 
Here `factory` is being used because we don't want to return a new instance of class but rather, we want to construct the class with some extra code. e.g. here we mapped the class variables w.r.t. given `Map`.
[Understanding Factory constructor code example - Dart]("https://stackoverflow.com/questions/53886304/understanding-factory-constructor-code-example-dart")

Now looking to the following code block.
```dart
@override
  void initState() {
    super.initState();
    loadData();
  }

  void loadData() async {
    // await Future.delayed(
    //   const Duration(seconds: 2),
    // );
    var catalogJson = await rootBundle.loadString("assets/data/catalog.json");
    var decodedJson = jsonDecode(catalogJson);
    CatalogModel.items =
        List.from(decodedJson).map<Item>((item) => Item.fromMap(item)).toList();
    setState(() {});
  }
```
`decodedJson` constains the `List` which we obtained (Discussed in Previous branch) and now we want to map this `List` in such a way that it gives us a `List<Item>` which we can pass. Refer to code
```dart
CatalogModel.items = List.from(decodedJson).map<Item>((item) => Item.fromMap(item)).toList();
```
Here `decodedJson` which is a `List<Map<String,Dynamic>>` has been mapped as `List<Item>` and stored into `CatalogModel.items`

### A Real Life Problem

Whatever we have done is not completely correct. If we add `Future.delayed()` (commented out part) by delaying process for 2 seconds, We'll see an error log in screen i.e. red screen. Which is not good at all. This is happeneing because, Althought We are feeding the data to `CatalogModel.items`, it is as empty `List` by default (refer to `lib\models\catalog.dart`) which makes sense since we'll not have any data initially and hence the lenght and all attributes of this `CatalogModel.items` which is a `List<Item>` is either `null` or empty. 

To avoid this problem, we need to add an condition. Dart does not allow us to use `if else` condition inside a function parameter (which almost no languages allow), but we do have ternenary operator that is `condtion ? true : false`

Here we use it to render `ListView.provider` or `CircularProgressIndicator`

```dart
CatalogModel.items.isNotEmpty
? ListView.builder(
    itemCount: CatalogModel.items.length,
    itemBuilder: (context, index) {
      return ItemWidget(
        item: CatalogModel.items[index],
      );
    },
  )
: const Center(
    child: CircularProgressIndicator(
      color: Colors.grey,
    ),
  )
```
This code checks if `CatalogModel.items.isNotEmpty` then render `ListView.builder` otherwise show `CircularProgressIndicator`
