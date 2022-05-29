## Branch Day 13

Loading and Decoding JSON

### Loading JSON

First, the path of the JSON file should be specified in `pubspec.yaml`. We converted `HomePage()` widget to `StatefullWidget` since now we'll bw loading data dynamically. For that we need to override a methos call `inState()` and then we can add following lines. (Refer to `lib\pages\home_page.dart`)

```dart
import 'package:flutter/services.dart';
import 'dart:convert';
@override
void initState() {
  super.initState();
  loadData();
}

void loadData() async {
  var catalogJson = await rootBundle.loadString("assets/data/catalog.json");
  var decodedJson = jsonDecode(catalogJson);
  print(decodedJson);
}
```
Here, `rootBundle` is imported from `service.dart` which helps us to read json as an string. This string is decode further to return an object with the help of `jsonDecode()` which is a import of `dart:convert`.
We can print this decoded data to check if everything is fine or not.

### JSON data generation

The data in `assets\data\catalog.json` is fetched from an API named [FakeStore API]("https://fakestoreapi.com/docs"). The data is collected with the help of following `python` code.

```python
import requests
import json

source = requests.get("https://fakestoreapi.com/products?limit=30")

if source.ok:
    data = source.json()
    with open("catalog.json","w") as f:
        json.dump(data,f)
else:
    print("data could not be fetched")
```