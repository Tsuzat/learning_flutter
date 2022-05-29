import 'package:flutter/material.dart';

import '../models/catalog.dart';

class ItemWidget extends StatelessWidget {
  final Item item;
  const ItemWidget({Key? key, required this.item}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      child: ListTile(
        onTap: () {},
        leading: SizedBox(
            width: 60,
          child: Image.network(
            item.image,
          ),
        ),
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
          textScaleFactor: 1.1,
          style: const TextStyle(
            fontWeight: FontWeight.w600,
            color: Colors.deepPurpleAccent,
          ),
        ),
      ),
    );
  }
}
