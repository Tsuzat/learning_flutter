## Branch Day12

ListView Builder, List Generation & Card

### [ListView.builder]("https://api.flutter.dev/flutter/widgets/ListView-class.html")

`ListView.builder()` gives us really infinite scrollable list view by rendering on screen data. 

```dart
child: ListView.builder(
  itemCount: dummyList.length,
  itemBuilder: (context, index) {
    return ItemWidget(
      item: dummyList[index],
    );
  },
)
```
here `itemBuilder` is a required parameter. `dummyList` is a list with 20 dummy data generated as
```dart
final dummyList = List.generate(20, (index) => CatalogModel.items[0]);
```
`CatalogModel` is a class which consist list of `Item` class. Refer to `lib\models\catalog.dart`

`ItemWidget` is a stateless widget. 

```dart
class ItemWidget extends StatelessWidget {
  final Item item;
  const ItemWidget({Key? key, required this.item}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      child: ListTile(
        onTap: () {},
        leading: Image.network(item.image),
        title: Text(
          item.title,
          overflow: TextOverflow.ellipsis,
        ),
        subtitle: Text(
          item.desc,
          overflow: TextOverflow.ellipsis,
        ),
        trailing: Text(
          "\$ ${item.price}",
          textScaleFactor: 1.2,
          style: const TextStyle(
            fontWeight: FontWeight.w600,
          ),
        ),
      ),
    );
  }
}
```
It takes an `item` as required parameter which is an instance of class `Item`. `ItemWidget` returns a `Card` containing a `ListTile`. The `Card` makes `ListTile` more fancy and good looking.