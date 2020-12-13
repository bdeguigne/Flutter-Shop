import 'package:flutter/material.dart';
import '../item.dart';

class Favorites extends StatelessWidget {
  const Favorites({Key key, this.items}) : super(key: key);

  final List<Item> items;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Favorites")
      ),
      body: Text("Favorites"),
    );
  }
}
