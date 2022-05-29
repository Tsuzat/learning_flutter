import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:learning_flutter/models/catalog.dart';
import 'dart:convert';
import '../widgets/drawer.dart';
import '../widgets/item_widget.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Learing Flutter",
        ),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: CatalogModel.items.isNotEmpty
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
              ),
      ),
      drawer: const MyDrawer(),
    );
  }
}
