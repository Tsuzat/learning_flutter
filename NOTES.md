## Branch Day16

GridView and GridTile

### [GridView]("https://api.flutter.dev/flutter/widgets/GridView-class.html")

`GridView` is just like `ListView`. Here we use `GridView.builder`.

```dart
GridView.builder(
  itemCount: CatalogModel.items.length,
  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
      mainAxisSpacing: 10,
      crossAxisSpacing: 10,
      crossAxisCount: 2),
  itemBuilder: (context, index) {
    final item = CatalogModel.items[index];
    return Card(
      clipBehavior: Clip.antiAlias,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10),
      ),
      child: GridTile(
        header: Container(
          padding: const EdgeInsets.all(10),
          decoration: const BoxDecoration(
            color: Colors.deepPurpleAccent,
          ),
          child: Text(
            item.title,
            overflow: TextOverflow.ellipsis,
            style: const TextStyle(color: Colors.white),
          ),
        ),
        footer:Container(
          padding: const EdgeInsets.all(10),
          decoration: const BoxDecoration(
            color: Colors.blueGrey,
          ),
          child: Text(
            '\$ ${item.price}',
            overflow: TextOverflow.ellipsis,
            style: const TextStyle(color: Colors.white),
          ),
        ),
        child: Image.network(item.image),
      ),
    );
  },
)
```
